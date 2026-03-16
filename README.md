# 🚀 Professional Flutter Riverpod Starter Template

A high-performance, senior-level Flutter boilerplate featuring **Riverpod** (State Management), **GoRouter** (Robust Routing), **Slang** (Type-safe i18n), and **ThemeExtensions** (Dynamic Styling).

---

## 🌟 Core Features

### 🏗️ Architecture & State Management
- **Riverpod (Modern Notifiers)**: Using the latest `Notifier` and `AsyncNotifier` patterns for robust, reactive state management.
- **GoRouter Integration**: A centralized, declarative routing system supporting deep linking, redirection guards, and complex navigation stacks.
- **Clean Folder Structure**: Organized by `core`, `features`, and `shared` to ensure separation of concerns.

### 🎨 Theming & Assets
- **Custom Theme Extensions**: Scalable light and dark mode implementation using `ThemeExtension` for custom tokens beyond the default `ColorScheme`.
- **Theme-Aware Assets**: Abstracted SVG and Image registries that automatically swap assets when the app theme changes.
- **Modern Typography**: High-performance Inter font integration with ergonomic `context` extensions.

### 🌎 Localization (i18n)
- **Slang Integration**: Type-safe, high-performance localization system (better than standard ARB files). 
- **EN/FR Support**: Pre-configured with English and French translations.
- **Runtime Locale Switching**: Change languages instantly without app restart.

### 🛠️ Utilities & Logging
- **Professional Startup Logging**: Detailed console output of device hardware, OS version, and app build details.
- **ANSI Color Logger**: Beautiful, high-visibility debug logs guarded by `kDebugMode`.
- **Advanced Input Handling**: `InputDescriptor` pattern to eliminate `TextEditingController` and `FocusNode` boilerplate.

---

## 🚀 How to Reuse (Getting Started)

Follow these steps to use this template for your new project:

### 1. Project Setup
```bash
# 1. Clone or copy this repository
# 2. Rename the package in pubspec.yaml (e.g., from flutter_riverpod_template to your_app_name)
# 3. Perform a global search and replace 'flutter_riverpod_template' -> 'your_app_name'
# 4. Run cleanup
flutter clean
flutter pub get
```

### 2. Change Bundle ID (Package Name)
To change the Android/iOS bundle identifier:
```bash
flutter pub add change_app_package_name
flutter pub run change_app_package_name:main com.yourdomain.yourapp
```

### 3. Generate Translations
If you modify anything in `lib/i18n/*.json`, run:
```bash
dart run slang
```

---

## 📁 Directory Structure

```text
lib/
├── core/
│   ├── constants/    # Theme-aware Assets, Shared Pref Keys
│   ├── extensions/   # MediaQuery, Theme, and Typography helpers
│   ├── providers/    # Global Providers (Theme, PackageInfo, etc.)
│   ├── router/       # GoRouter Config and Route Constants
│   ├── service/      # Startup and Platform services
│   ├── themes/       # Light/Dark Theme definitions
│   └── validators/   # Robust form validation logic
├── features/         # Feature-based modules (Home, Settings, etc.)
├── i18n/             # slang JSON translation files and generated code
├── shared/           # Reusable UI widgets (Buttons, TextFields)
└── main.dart         # Entry point with ProviderScope overrides
```

---

## ✅ Best Practices Checklist
- [x] **Const Everything**: Use `const` constructors for performance.
- [x] **Private Constructors**: Utility classes like `PrefsKeys` are not instantiable.
- [x] **Dispose Listeners**: All `ValueNotifier` and `FocusNode` listeners are properly cleaned up.
- [x] **Clean Analysis**: Run `flutter analyze` to ensure 0 lint errors.

---

## 📄 License
This template is open-source and free to use for personal and commercial projects. Feel free to contribute or suggest improvements!

---
*Maintained by Sh M Ahmer*
