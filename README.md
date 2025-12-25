# MindEase – Student–Teacher Counselling Management System

## Problem Statement
Educational institutions lack a secure, structured, and scalable system for continuous student counselling and follow‑up.

---

## Project Overview
**MindEase** is a web‑based student–teacher counselling management system designed to provide structured, confidential, and continuous counselling support within educational institutions.  
It enables students to raise counselling requests, communicate privately with assigned teachers, and receive timely guidance. Teachers are assisted by responsible AI for drafting empathetic responses, while administrators gain insights through analytics dashboards.

The platform focuses on **privacy, continuity of care, and data‑driven decision making**.

---

## Key Features

### 👩‍🎓 Student
- Secure login and profile management  
- Raise counselling requests by category  
- Private, thread‑based counselling conversations  
- View complete counselling history  
- Continue follow‑up conversations securely  

### 👨‍🏫 Teacher
- View assigned student counselling requests  
- Receive notifications for new student messages  
- Respond to counselling sessions  
- AI‑assisted response generation using **Gemma AI**  
- View counselling history and follow‑ups  

### 🛠️ Admin
- User and role management  
- Assign students to teachers  
- Monitor all counselling sessions  
- Analytics dashboard with visual insights using **Google Charts**  

---

## Google Technologies Used (Mandatory)

- **Google Charts**  
  Used in the Admin Dashboard to visualize:
  - Counselling request status (Pending / Completed)
  - Category‑wise counselling trends
  - Teacher‑wise session handling

- **Google Analytics (GA4)**  
  Integrated into the application to track:
  - User engagement
  - Active users
  - Platform adoption  
  *(Analytics track usage only — counselling content remains private.)*

- **Google Cloud (Deployment‑Ready Architecture)**  
  The application is designed for deployment on Google Cloud infrastructure (App Engine / Compute Engine).

- **Gemma AI (Google AI Ecosystem)**  
  Used to assist teachers by generating empathetic and context‑aware counselling responses.  
  AI supports teachers — it does not replace human decision‑making.

---

## Responsible AI Usage
- AI is used only as an **assistive tool** for teachers  
- Final responses are always reviewed and sent by teachers  
- No automated counselling decisions are made  
- Promotes ethical and responsible AI adoption

---

## Security & Privacy
- Role‑based authentication (Student / Teacher / Admin)
- Each counselling request is handled as an **independent private conversation**
- Parameterized SQL queries prevent SQL injection
- Analytics do not access or store counselling message content

---

## Tech Stack
- **Frontend:** HTML, CSS  
- **Backend:** Python (Flask)  
- **Database:** MySQL  
- **AI Integration:** Gemma AI (via local inference)  
- **Analytics & Visualization:** Google Analytics, Google Charts  

---

## Setup Instructions

1. Clone the repository  
   ```bash
   git clone <your-repo-link>
   cd mindease
