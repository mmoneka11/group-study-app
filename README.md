# 📚 Group Study App

![Project Logo](https://img.shields.io/badge/Project-Group%20Study%20App-blue)  ![Language](https://img.shields.io/badge/Language-Dart-yellow) ![Framework](https://img.shields.io/badge/Framework-Flutter-green)


The Group Study App is an interactive learning platform designed to enable students to collaborate, share resources, and learn together efficiently. The app allows students to **create and join study groups**, chat in real time, share study materials, and manage study sessions — all in one place.

The app’s goal is to foster a digital learning environment where users can communicate, clarify doubts, and collaborate seamlessly — all in one unified platform.

---

## 🖼️ App Preview (Wireframes / UI Screens)

<!-- | Splash Screen | Login Screen | Home Screen | Chat Screen |
|----------------|--------------|--------------|--------------|
| ![Splash](assets/images/splash_screen.png) | ![Login](assets/images/login_screen.png) | ![Home](assets/images/home_screen.png) | ![Chat](assets/images/chat_screen.png) | -->


---

## ❓ Problem Statement

Students often struggle to coordinate in study groups — managing discussions, resources, and meeting schedules becomes messy and unproductive.  
There’s a need for a **dedicated platform** that supports **seamless collaboration, communication, and study management**.

---

## 🎯 Scope

To make **group learning interactive and organized** by connecting students in digital study rooms, enabling real-time chat, file sharing, and scheduling.

The app focuses on:
- Enabling students to **collaborate remotely**
- Providing a **common platform** for communication
- Helping teams stay on track with **reminders and shared tasks**
- Offering an intuitive **user interface for easy navigation**
---

## 👥 Target Users

| User Type | Description |
|------------|--------------|
| **Students** | Join or create study groups, chat, and share resources |
| **Admins / Group Leaders** | Manage groups, post announcements, and moderate discussions |

---

## ⚙️ Methodology

The project followed a modular and iterative development approach:
1. **Planning & Design:** Defined app goals, features, and user flow; designed UI wireframes.
2. **Frontend Development:** Built using Flutter for cross-platform support.
3. **Backend Integration:** Implemented REST APIs for group listing and details.
5. **Testing & Debugging:** Conducted functionality and user-experience testing.
6. **Final Deployment:** Ensured responsiveness and tested on web and Android platforms.

---

## 🧭 Navigation Flow

1. **Splash Screen** → Intro or logo animation  
2. **Login / Signup** → User authentication  
3. **Home Dashboard** → Joined or available groups  
4. **Group Listing and Details** → Members, resources, chat  
5. **Chat Screen** → Real-time discussions  
6. **Reminders Screen** → Upcoming study sessions  

---

## 🗂️ Folder Structure

```
group_study_app/
│
├── lib/
│ ├── main.dart # Entry point
│ ├── screens/
│ │ ├── splash_screen.dart # Splash screen UI
│ │ ├── login_screen.dart # Login / Signup UI
│ │ ├── home_screen.dart # Dashboard view
│ │ ├── grouplisting.dart
│ │ ├── groupdetails.dart
│ │ ├── chat_screen.dart # Real-time chat
│ │ └── reminder_screen.dart # Study reminders
│ ├── widgets/ # Custom reusable widgets
│ ├── models/ # Data models
│ └── services/ # Backend (Firebase integration)
│
├── assets/
│ └── images/ # App logos and screenshots
│
├── pubspec.yaml # Dependencies and assets
├── README.md # Documentation
└── .gitignore # Ignored files
```

---

## ⚙️ Tech Stack

| Tool | Purpose |
|------|----------|
| **Flutter (Dart)** | UI and app logic |
| **Mock JSON API / assets/groups.json** | Simulated backend data |
| **Firebase (Future)** | Authentication & Realtime DB |
| **Figma / Whimsical** | UI/UX design & prototype|
| **Git & GitHub** | Version control and collaboration |

---

## 🧰 Installation & Setup Guide

### 1️⃣ Install Flutter (on D: drive)
1. Download Flutter SDK: https://flutter.dev/docs/get-started/install/windows
2. Extract it to `D:\flutter`
3. Add `D:\flutter\bin` to **System Path**
4. Restart terminal and check installation:
   ```bash
   flutter doctor
   ```

### 2️⃣ Run the App (without Android Studio)
Run on Chrome or connected phone:

```bash
flutter run -d chrome
```

---

## 🚀 GitHub Setup

```bash
git init
git add .
git commit -m "Initial Flutter project setup"
git branch -M main
git remote add origin https://github.com/mmoneka11/group_study_app.git
git push -u origin main
```

---
## 🎥 Demo Video

You can watch the demo video below:

[![Watch the Demo](https://img.shields.io/badge/▶️%20Play%20Demo-Group%20Study%20App-blue?style=for-the-badge)](https://github.com/mmoneka11/group-study-app/raw/refs/heads/main/Demo%20Video/Demo-Video.mp4)

<video src="https://github.com/mmoneka11/group-study-app/raw/refs/heads/main/Demo%20Video/Demo-Video.mp4" width="600" controls></video>

---

## 🧠 Team Credits

| Role   | Name   | GitHub | Medium | Contribution |
|--------|--------|--------|--------|---------------|
| 👩‍💻 **Team Lead / Developer**  | ***Quinta Mellisa*** | [GitHub](https://github.com/mm) | [Medium](https://medium.com/@mm) | Program listing & details screens, full API integration |
| 👩‍💻 **Project Manager / Developer**    | ***Moneka Meghwar*** | [GitHub](https://github.com/mmoneka11) | [Medium](https://medium.com/@mmoneka11) |Flutter setup, UI logic integration, documentation, and overall coordination |
| 👩‍💻 **Project Manager**  | ***Malak Mohamed Kamal*** | [GitHub](https://github.com/username1) | [Medium](https://medium.com/@username1) | Login page and Home page design and documentation |
| 👨‍💻 **Project Lead / UI Designer**  | ***Adil Irfan*** | [GitHub](https://github.com/username1) | [Medium](https://medium.com/@username1) | Wireframes, Design Assistance |
| 👩‍💻 **Project Scribe / Developer**  |  ***Aadil Meghwar***| [GitHub](https://github.com/username2) | [Medium](https://medium.com/@username2) | Splash screen, Signup screen development, and UI enhancements |
| 👩‍💻 **Project Scribe**  | ***Alexus Lee*** | [GitHub](https://github.com/username2) | [Medium](https://medium.com/@username2) | Research, Content Support |

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💬 Quote

> “Learn together, grow together — Group Study App brings collaboration to learning.”

---

## 🔗 Repository Link

👉 https://github.com/mmoneka11/group_study_app
