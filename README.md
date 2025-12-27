# EduHub - Modern Learning Platform

EduHub is a comprehensive EdTech application built with Flutter, designed to offer a premium learning experience through a sleek, glassmorphic interface. It facilitates course exploration, video learning, and user management with robust state handling and local persistence.

## 🚀 Features

### 🔐 Authentication & Security
- **Secure Sign Up & Sign In**: Full registration flow with validation (Name, Email, Phone, Password).
- **Persistent Sessions**: Users remain logged in across app restarts using `SharedPreferences`.
- **Smart Redirection**: Automated routing directs users to the appropriate screen (Onboarding vs Login vs Home) based on their auth state.

### 📺 Content Exploration
- **Explore Tab**: Dynamically fetches and displays YouTube playlists using `youtube_explode_dart`.
- **Robust Loading**: Includes pull-to-refresh, error handling, and retry mechanisms for unreliable networks.
- **Video Metadata**: Displays thumbnails, titles, and durations for a rich browsing experience.

### ⚙️ User Preferences
- **Settings Dashboard**: Centralized hub for app configuration.
- **Theme Switching**: Toggle between System, Light, and Dark modes.
- **Localization**: Instant language switching (English/Bengali) with `flutter_localizations`.
- **Profile Management**: View user details with a dedicated profile screen.

### 🎨 UI/UX Design
- **Glassmorphism**: Modern, translucent UI elements with gradients and blur effects.
- **Responsive Layouts**: optimized for various screen sizes with centered forms and safe-area handling.
- **Interactive Onboarding**: engaging introductory flow for new users.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev) (Supports Android, iOS, Windows)
- **State Management**: [Riverpod](https://riverpod.dev) (v2+ with Code Generation & Annotations) via `flutter_riverpod` and `riverpod_annotation`.
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router) for declarative, deep-linkable routing.
- **Data Fetching**: `youtube_explode_dart` for accessing YouTube content without API keys.
- **Local Storage**: `shared_preferences` for persisting auth tokens and user settings.
- **Localization**: `flutter_localizations` with `.arb` files for type-safe internationalization.
- **Code Utilities**: `freezed_annotation`, `json_annotation` for immutable data models.

## 📂 Project Structure

```
lib/
├── src/
│   ├── core/               # Shared utilities (Router, Storage, Theme, Widgets)
│   ├── features/           # Feature-based architecture
│   │   ├── authentication/ # Login, Register, Repositories, Controllers
│   │   ├── explore/        # YouTube integration, Explore Screen
│   │   ├── home/           # Main Shell, Settings, Profile
│   │   └── onboarding/     # Intro screens
│   └── l10n/               # Localization files (.arb)
└── main.dart               # App Entry Point
```

## 📱 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/eduhub.git
    cd eduhub
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Generate code** (required for Riverpod/Freezed):
    ```bash
    dart run build_runner build -d
    ```

4.  **Run the app**:
    ```bash
    flutter run
    ```

## 🧪 Testing & Quality

- **Linting**: adheres to strict Flutter analyzer rules.
- **Formatting**: Codebase formatted with `dart format`.
- **Architecture**: Clean Architecture principles with separation of Data, Domain, and Presentation layers.

---
*Developed with ❤️.*
