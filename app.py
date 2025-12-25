from flask import Flask, render_template, request, redirect, session
from werkzeug.security import generate_password_hash, check_password_hash
import mysql.connector
from datetime import datetime
import subprocess
from functools import wraps   # ✅ REQUIRED

app = Flask(__name__)
app.secret_key = "super_secret_key_123"

# ================= DATABASE CONNECTION =================
def get_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="your-password",
        database="counselling_system",
        autocommit=True
    )

# ================= LOGIN REQUIRED =================
def login_required(role=None):
    def decorator(func):
        @wraps(func)   # ✅ FIX
        def wrapper(*args, **kwargs):
            if "user_id" not in session:
                return redirect("/")
            if role and session.get("role") != role:
                return "Unauthorized Access", 403
            return func(*args, **kwargs)
        return wrapper
    return decorator

# ================= LOGIN =================
@app.route("/")
def login_page():
    return render_template("login.html")

@app.route("/login", methods=["POST"])
def login():
    usn = request.form["USN"]
    password = request.form["password"]
    role = request.form["role"]

    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM users WHERE USN=%s AND role=%s",
        (usn, role)
    )
    user = cursor.fetchone()

    if not user or not check_password_hash(user["password"], password):
        return render_template("login.html", error="Invalid credentials")

    session["user_id"] = user["id"]
    session["role"] = user["role"]
    session["name"] = user["UserName"]

    return redirect(f"/{role}/dashboard")

@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")

# ======================================================
# ===================== STUDENT ========================
# ======================================================

@app.route("/student/dashboard")
@login_required("student")
def student_dashboard():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("""
        SELECT u.UserName, s.department, s.class, s.email
        FROM users u
        JOIN students s ON u.id = s.user_id
        WHERE u.id=%s
    """, (session["user_id"],))

    student = cursor.fetchone()

    return render_template(
        "student/dashboard.html",
        student=student,
        name=session["name"]
    )

@app.route("/student/request", methods=["GET", "POST"])
@login_required("student")
def student_request():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == "POST":
        cursor.execute(
            "SELECT id FROM students WHERE user_id=%s",
            (session["user_id"],)
        )
        student = cursor.fetchone()

        cursor.execute("""
            INSERT INTO counselling_requests (student_id, problem, category, status)
            VALUES (%s, %s, %s, 'Pending')
        """, (
            student["id"],
            request.form["problem"],
            request.form["category"]
        ))

        return redirect("/student/history")

    return render_template("student/request.html")

@app.route("/student/history")
@login_required("student")
def student_history():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    # ✅ FIX: map users.id → students.id
    cursor.execute(
        "SELECT id FROM students WHERE user_id=%s",
        (session["user_id"],)
    )
    student = cursor.fetchone()

    cursor.execute("""
        SELECT id,problem, category, status, created_at
        FROM counselling_requests
        WHERE student_id=%s
        ORDER BY created_at DESC
    """, (student["id"],))

    history = cursor.fetchall()
    return render_template("student/history.html", history=history)

@app.route("/student/reply/<int:request_id>", methods=["GET", "POST"])
@login_required("student")
def student_reply(request_id):
    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == "POST":
        cursor.execute("""
            INSERT INTO counselling_messages (request_id, sender_role, message)
            VALUES (%s, 'student', %s)
        """, (request_id, request.form["message"]))

        return redirect(f"/student/reply/{request_id}")

    cursor.execute("""
        SELECT sender_role, message, created_at
        FROM counselling_messages
        WHERE request_id=%s
        ORDER BY created_at
    """, (request_id,))

    messages = cursor.fetchall()

    return render_template(
        "student/reply.html",
        messages=messages,
        request_id=request_id,
        name=session["name"]
    )

@app.route("/student/profile", methods=["GET", "POST"])
@login_required("student")
def student_profile():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == "POST":
        cursor.execute("""
            INSERT INTO students (user_id, department, class, email)
            VALUES (%s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                department=VALUES(department),
                class=VALUES(class),
                email=VALUES(email)
        """, (
            session["user_id"],
            request.form["department"],
            request.form["class"],
            request.form["email"]
        ))

        return redirect("/student/dashboard")

    return render_template("student/profile.html")

# ======================================================
# ===================== TEACHER ========================
# ======================================================

@app.route("/teacher/dashboard")
@login_required("teacher")
def teacher_dashboard():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("""
        SELECT COUNT(DISTINCT cr.id) AS new_count
        FROM counselling_requests cr
        JOIN students s ON cr.student_id = s.id
        JOIN teachers t ON s.assigned_teacher_id = t.id
        JOIN counselling_messages cm ON cm.request_id = cr.id
        LEFT JOIN counselling_responses cres ON cres.request_id = cr.id
        WHERE t.user_id = %s
        AND cm.sender_role = 'student'
        AND (
            cres.completed_at IS NULL
            OR cm.created_at > cres.completed_at
        )
    """, (session["user_id"],))

    new_messages = cursor.fetchone()["new_count"]

    return render_template(
        "teacher/dashboard.html",
        name=session["name"],
        new_messages=new_messages
    )


@app.route("/teacher/request", methods=["GET", "POST"])
@login_required("teacher")
def teacher_request():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    ai_text = None
    selected_request_id = None

    if request.method == "POST" and "generate_ai" in request.form:
        selected_request_id = request.form["request_id"]

        cursor.execute("""
            SELECT sender_role, message
            FROM counselling_messages
            WHERE request_id=%s
            ORDER BY created_at
        """, (selected_request_id,))

        conversation = "\n".join(
            [f"{m['sender_role']}: {m['message']}" for m in cursor.fetchall()]
        )
        ai_text = gemma_response(conversation)

    cursor.execute("""
        SELECT cr.id, cr.problem, cr.category, u.UserName AS student_name
        FROM counselling_requests cr
        JOIN students s ON cr.student_id = s.id
        JOIN users u ON s.user_id = u.id
        JOIN teachers t ON s.assigned_teacher_id = t.id
        WHERE t.user_id=%s AND (
    cr.status = 'Pending'
    OR cr.id IN (
        SELECT cm.request_id
        FROM counselling_messages cm
        WHERE cm.sender_role = 'student'
        AND cm.created_at > (
            SELECT IFNULL(MAX(cres.completed_at), '1970-01-01')
            FROM counselling_responses cres
            WHERE cres.request_id = cm.request_id
        )
    )
)

    """, (session["user_id"],))

    return render_template(
        "teacher/request.html",
        requests=cursor.fetchall(),
        ai_text=ai_text,
        selected_request_id=selected_request_id,
        name=session["name"]
    )

@app.route("/teacher/history")
@login_required("teacher")
def teacher_history():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            cr.id AS request_id,
            cr.problem,
            u.UserName AS student_name,
            cres.teacher_response,
            cres.completed_at
        FROM counselling_responses cres
        JOIN counselling_requests cr ON cres.request_id = cr.id
        JOIN students s ON cr.student_id = s.id
        JOIN users u ON s.user_id = u.id
        JOIN teachers t ON s.assigned_teacher_id = t.id
        WHERE t.user_id=%s
        ORDER BY cres.completed_at DESC
    """, (session["user_id"],))

    history = cursor.fetchall()

    return render_template(
        "teacher/history.html",
        history=history,
        name=session["name"]
    )

@app.route("/teacher/reply/<int:request_id>", methods=["GET", "POST"])
@login_required("teacher")
def teacher_reply(request_id):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    ai_text = None

    if request.method == "POST":

        if "generate_ai" in request.form:
            cursor.execute("""
                SELECT sender_role, message
                FROM counselling_messages
                WHERE request_id=%s
                ORDER BY created_at
            """, (request_id,))

            conversation = "\n".join(
                [f"{m['sender_role']}: {m['message']}" for m in cursor.fetchall()]
            )
            ai_text = gemma_response(conversation)

        elif "send_reply" in request.form:
            teacher_msg = request.form["message"]

            cursor.execute("""
                INSERT INTO counselling_messages (request_id, sender_role, message)
                VALUES (%s, 'teacher', %s)
            """, (request_id, teacher_msg))

            cursor.execute("""
                INSERT INTO counselling_responses (request_id, teacher_response, completed_at)
                VALUES (%s, %s, %s)
                ON DUPLICATE KEY UPDATE
                    teacher_response = VALUES(teacher_response),
                    completed_at = VALUES(completed_at)
            """, (request_id, teacher_msg, datetime.now()))

            cursor.execute("""
                UPDATE counselling_requests
                SET status='Completed'
                WHERE id=%s
            """, (request_id,))

            return redirect(f"/teacher/reply/{request_id}")

    cursor.execute("""
        SELECT sender_role, message, created_at
        FROM counselling_messages
        WHERE request_id=%s
        ORDER BY created_at
    """, (request_id,))

    messages = cursor.fetchall()

    return render_template(
        "teacher/reply.html",
        messages=messages,
        ai_text=ai_text,
        request_id=request_id,
        name=session["name"]
    )

# ======================================================
# ===================== ADMIN ==========================
# ======================================================

@app.route("/admin/dashboard")
@login_required("admin")
def admin_dashboard():
    return render_template("admin/dashboard.html", name=session["name"])

@app.route("/admin/create-user", methods=["GET", "POST"])
@login_required("admin")
def admin_create_user():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == "POST":
        hashed = generate_password_hash(request.form["password"])

        cursor.execute("""
            INSERT INTO users (UserName, USN, password, role)
            VALUES (%s, %s, %s, %s)
        """, (
            request.form["UserName"],
            request.form["USN"],
            hashed,
            request.form["role"]
        ))

        return redirect("/admin/dashboard")

    return render_template("admin/create_user.html")

@app.route("/admin/users")
@login_required("admin")
def admin_users():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT id, UserName, USN, role FROM users")
    users = cursor.fetchall()

    return render_template("admin/user.html", users=users)

@app.route("/admin/assign", methods=["GET", "POST"])
@login_required("admin")
def admin_assign():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == "POST":
        student_id = request.form["student_id"]
        teacher_id = request.form["teacher_id"]

        cursor.execute("""
            UPDATE students
            SET assigned_teacher_id = %s
            WHERE id = %s
        """, (teacher_id, student_id))

        return redirect("/admin/assign")

    cursor.execute("""
        SELECT s.id, u.UserName
        FROM students s
        JOIN users u ON s.user_id = u.id
    """)
    students = cursor.fetchall()

    cursor.execute("""
        SELECT t.id, u.UserName
        FROM teachers t
        JOIN users u ON t.user_id = u.id
    """)
    teachers = cursor.fetchall()

    return render_template(
        "admin/assign.html",
        students=students,
        teachers=teachers
    )

@app.route("/admin/sessions")
@login_required("admin")
def admin_sessions():
    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            u.UserName,
            cr.problem,
            cr.category,
            cr.status,
            cr.created_at
        FROM counselling_requests cr
        JOIN students s ON cr.student_id = s.id
        JOIN users u ON s.user_id = u.id
        ORDER BY cr.created_at DESC
    """)

    sessions = cursor.fetchall()
    return render_template("admin/sessions.html", sessions=sessions)

@app.route("/admin/analytics")
@login_required("admin")
def admin_analytics():
    db = get_db()
    cursor = db.cursor()

    cursor.execute("SELECT status, COUNT(*) FROM counselling_requests GROUP BY status")
    status_data = cursor.fetchall()

    cursor.execute("SELECT category, COUNT(*) FROM counselling_requests GROUP BY category")
    category_data = cursor.fetchall()

    cursor.execute("""
        SELECT u.UserName, COUNT(cres.id)
        FROM counselling_responses cres
        JOIN counselling_requests cr ON cres.request_id = cr.id
        JOIN students s ON cr.student_id = s.id
        JOIN teachers t ON s.assigned_teacher_id = t.id
        JOIN users u ON t.user_id = u.id
        GROUP BY u.UserName
    """)
    teacher_data = cursor.fetchall()

    return {
        "status": status_data,
        "category": category_data,
        "teachers": teacher_data
    }

# ======================================================
# ===================== GEMMA AI =======================
# ======================================================

def gemma_response(conversation):
    prompt = f"""
You are a calm college counsellor.
Read the conversation fully and reply like a human teacher.
No bullet points. No markdown. Step by step guidance.

Conversation:
{conversation}

Reply:
"""
    try:
        result = subprocess.run(
            ["ollama", "run", "gemma:2b"],
            input=prompt,
            text=True,
            capture_output=True,
            encoding="utf-8",
            timeout=60
        )
        return result.stdout.strip() or "I'm here. Let's talk this through."
    except:
        return "AI is temporarily unavailable."

# ================= RUN =================
if __name__ == "__main__":
    app.run(
        host="127.0.0.1",
        port=5000,
        debug=True,
        use_reloader=False
    )
