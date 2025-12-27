# EduHub - A Modern EdTech Platform

## 🚀 Introduction

EduHub is a state-of-the-art EdTech application designed to provide a seamless and engaging learning experience. Built with performance and scalability in mind, it bridges the gap between students and high-quality educational content. EduHub features a sleek, glassmorphic UI, intuitive navigation, and robust functionality, offering everything from course exploration to a dedicated Learning Management System (LMS) with video playback and playlist management.

Whether you're exploring new topics or deep-diving into a specialized course, EduHub delivers a premium mobile experience.

## ✨ Key Features

- **Modern Glassmorphic UI**: A visually stunning interface with gradient backgrounds and glass effects.
- **Learning Management System (LMS)**:
  - **Integrated Video Player**: Professional playback controls, quality settings, and dynamic metadata.
  - **Playlist Management**: Seamless navigation (Next/Prev) and a bottom-sheet playlist viewer.
- **Explore & Discover**: Browse a wide range of courses and educational videos.
- **Interactive Onboarding**: A smooth 4-page onboarding flow with animations and localization support.
- **Authentication**: Secure login and registration with persistent session management.
- **Localization**: Full support for English and Bengali languages.

## 🛠️ Technology Stack

EduHub is built using a modern Flutter stack to ensure reliability, maintainability, and top-tier performance:

- **Framework**: [Flutter](https://flutter.dev/) (SDK > 3.5.0)
- **State Management**: [Riverpod](https://riverpod.dev/) (v2.5.1) used with code generation (`riverpod_generator`) for type-safe, compile-time verified state management.
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router) (v13.0.0) for declarative routing and deep linking.
- **Networking**: [Dio](https://pub.dev/packages/dio) for robust HTTP requests.
- **Video Integration**:
  - `youtube_explode_dart`: For fetching rich video metadata without API keys.
  - `youtube_player_flutter`: For a native-like video playback experience.
- **Immutability**: [Freezed](https://pub.dev/packages/freezed) for generating immutable data classes and unions.
- **Functional Programming**: `fpdart` for error handling and functional paradigms.
- **Local Storage**: `shared_preferences` for persisting user sessions and settings.
- **Localization**: `flutter_localizations` & `intl` for multi-language support.

## 📱 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/eduhub.git
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the app**:
    ```bash
    flutter run
    ```

---
*Built with ❤️ by the EduHub Team.*
