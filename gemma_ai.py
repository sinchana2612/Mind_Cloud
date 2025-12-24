import subprocess

def generate_ai_response(issue):
    prompt = f"""
You are an experienced teacher and student counsellor.

Respond as a teacher speaking directly to a student.
Be empathetic, supportive, and practical.
Do NOT mention AI.

Student issue:
{issue}
"""

    result = subprocess.run(
        ["ollama", "run", "gemma3"],
        input=prompt,
        text=True,
        capture_output=True
    )

    return result.stdout.strip()
