# 🧠 MindEase  
## Student–Teacher Counselling Management System

---

## 🧩 Problem Statement
Educational institutions often lack a **secure, structured, and continuous counselling system**.  
Traditional counselling methods are informal, difficult to track, and do not support long-term follow-up, performance-based intervention, or analytics-driven insights.

---

## 🌱 Project Overview
**MindEase** is a **web-based Student–Teacher Counselling Management System** designed to provide a **private, structured, and scalable counselling platform** for educational institutions.

The system enables:
- Students to seek help without hesitation  
- Teachers to provide timely and empathetic guidance  
- Administrators to monitor counselling trends and effectiveness  

The platform emphasizes **confidentiality, continuity of care, responsible AI assistance, and data-driven decision-making**.

---

## ✨ Key Features

### 👩‍🎓 Student Module
- Secure login and profile management  
- Submit counselling requests by category (Academic, Mental, Personal, Health)  
- View and continue private counselling conversations  
- Receive counselling requests initiated by teachers  
- Accept or reject teacher-initiated counselling requests  
- Maintain complete counselling history  
- Provide feedback and ratings after session completion  

---

### 👨‍🏫 Teacher Module
- View assigned student counselling requests  
- Reply to counselling conversations  
- AI-assisted response suggestions using **Gemma AI**  
- Upload student marks and attendance via Excel  
- Identify students needing counselling based on performance  
- Initiate counselling requests to students  
- Track counselling history and student feedback  
- Export counselling reports as Excel files  

---

### 🛠️ Admin Module
- Role-based user management (Student / Teacher / Admin)  
- Assign students to teachers  
- Monitor all counselling sessions (with anonymity preserved where required)  
- Analytics dashboard with visual insights  
- Review anonymous student feedback and ratings  

---

## 🤖 Responsible AI Usage (Gemma AI)
- AI is used **only as an assistive tool** for teachers  
- Generates empathetic draft responses based on conversation context  
- Teachers always **review and finalize** responses  
- No automated counselling decisions are made  
- Promotes ethical and responsible AI adoption  

---

## 📊 Google Technologies Used (Mandatory)

### ✅ Google Analytics (GA4)
Integrated across the application to track:
- User engagement  
- Active users  
- Platform adoption metrics  

> Counselling message content is **never tracked or analyzed**.

---

### ✅ Google Charts
Used in the **Admin Dashboard** to visualize:
- Counselling request status (Pending / Responded / Ended)  
- Category-wise counselling trends  
- Overall counselling activity insights  

---

### ✅ Google Cloud (Deployment-Ready Architecture)
- Designed for deployment on **Google Cloud App Engine / Compute Engine**  
- Scalable backend using Flask and MySQL  
- Cloud-ready analytics and reporting structure  

---

## 🔐 Security & Privacy
- Role-based authentication and authorization  
- Secure session handling  
- Confidential counselling conversations  
- Anonymous counselling support where requested  
- Parameterized SQL queries to prevent SQL injection  
- Analytics and reports exclude sensitive message content  

---

## 🧱 Tech Stack

| Layer            | Technology |
|------------------|------------|
| Frontend         | HTML, CSS |
| Backend          | Python (Flask) |
| Database         | MySQL |
| AI Integration   | Gemma AI (Local inference via Ollama) |
| Analytics        | Google Analytics (GA4) |
| Visualization    | Google Charts |
| Reporting        | Excel (OpenPyXL, Pandas) |

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository  
   ```bash
   git clone https://github.com/sinchana2612/Mind_Cloud
   cd mindease
   pip install -r requirements.txt
   python app.py

NOTE : “Update database credentials in app.py before running.”

🧪 Demo Accounts (Optional)

-Student
-Teacher
-Admin

(Credentials can be pre-seeded in the database for demonstration purposes.)

🌟 Highlights

-Privacy-first counselling design
-Continuous follow-up conversations
-Performance-based counselling triggers
-Ethical AI assistance
-Scalable and analytics-driven architecture

🏁 Conclusion

MindEase bridges the gap between academic performance, mental well-being, and structured counselling.
By combining human empathy, responsible AI, and data analytics, it delivers a modern, ethical, and scalable counselling solution for educational institutions.

