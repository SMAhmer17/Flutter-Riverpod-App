# Flutter Riverpod Starter Template

A senior-level Flutter boilerplate covering state management, routing, Firebase, networking, local storage, and a full shared widget library — ready to drop into any production project.

---

## Stack

| Layer | Technology |
|---|---|
| State Management | Riverpod 3 (`Notifier` / `AsyncNotifier`) |
| Navigation | GoRouter |
| Localization | Slang (type-safe i18n) |
| Auth | Firebase Auth (email, Google, Apple, phone, anonymous) |
| Database | Cloud Firestore |
| Storage | Firebase Storage |
| Cloud Functions | Cloud Functions (callable) |
| HTTP | `package:http` + Dio |
| Local Storage | SharedPreferences · Hive · FlutterSecureStorage |
| Connectivity | connectivity_plus |
| Theming | ThemeExtension (light + dark) |

---

## Features

### Auth
- Email/password sign-in and sign-up
- Forgot password (email reset)
- Google Sign-In
- Apple Sign-In (SHA-256 nonce)
- Phone OTP verification
- Anonymous sign-in
- Re-authentication
- Account deletion
- Auth state stream

### Networking
- **DioService** — interceptors, cancel tokens, upload/download with progress
  - `LoggingInterceptor` — request/response logging via AppLogger
  - `AuthInterceptor` — Bearer token injection, concurrent-safe 401 refresh with queue
  - `DioService.withAuth(...)` factory for one-liner setup
- **HttpService** — lightweight client with multipart upload support
- Both follow constructor injection with config objects (`DioConfig` / `HttpOptions`)

### Firebase Services
- **FirestoreService** — CRUD, real-time streams, subcollections, batch writes, transactions
- **CloudFunctionService** — typed callable wrappers (`call<T>`, `callMap`, `callList`, `callVoid`)

### Local Storage
- **SharedPrefsStore** — typed primitives (String, int, double, bool, List<String>)
- **SecureStore** — AES-encrypted (Android) / Keychain (iOS) key-value store
- **HiveStore** / **LazyHiveStore** — structured object storage with change streams

### Connectivity
- **ConnectivityService** — `isConnected`, `onStatusChanged` stream, `ensureConnected()` guard, `runIfConnected(task)` wrapper

### Shared Widgets
- **AppScaffold** — theme-aware scaffold; syncs status bar and navigation bar colours via `AnnotatedRegion` (scoped per-route, auto-restores on pop)
- **NoContentWidget** — configurable empty-state with icon, title, subtitle, retry button
- **NoInternetWidget** — animated no-connection state (pulsing icon), expand/inline modes
- **PrimaryButton** / **CustomOutlineButton** — gradient button with loading state
- **CustomTextField** — full-featured input with validation, formatters, iOS toolbar overlay

### Core Utilities
- **AppLogger** — ANSI-coloured debug logs (debug-mode only)
- **AppScaffold** — system UI colour management
- **Validators** — email, password, PIN, mandatory field validators
- **StartupService** — device/OS info logging on launch

---

## Directory Structure

```
lib/
├── core/
│   ├── config/               # App-wide config constants
│   ├── constants/            # Theme colours, icons, images, prefs keys
│   ├── extensions/           # Theme + typography context extensions
│   ├── helpers/              # HelperFunction (overlay, focus, first-launch)
│   ├── providers/            # Global Riverpod providers
│   ├── router/               # GoRouter setup + route constants
│   ├── service/
│   │   ├── api/
│   │   │   ├── dio/          # DioConfig, DioService, DioInterceptors
│   │   │   └── http/         # HttpOptions, HttpService, HttpException
│   │   ├── local_store/      # SharedPrefsStore, SecureStore, HiveStore
│   │   ├── cloud_function_serivce.dart
│   │   ├── connectivity_service.dart
│   │   ├── firestore_service.dart
│   │   └── startup_service.dart
│   ├── themes/               # AppTheme, AppTypography, light/dark themes
│   ├── utils/                # AppLogger, utils
│   └── validators/           # Form validators
├── features/
│   └── auth/
│       └── datasource/       # AuthDataSource (all Firebase auth methods)
├── shared/
│   ├── widgets/
│   │   ├── app_scaffold.dart
│   │   ├── no_content_widget.dart
│   │   └── no_internet_widget.dart
│   ├── custom_text_field.dart
│   ├── primary_button.dart
│   └── tap_widget.dart
├── i18n/                     # Slang JSON + generated translation files
└── main.dart
```

---

## Getting Started

### 1. Clone and rename

```bash
# 1. Clone the repo
# 2. Replace package name everywhere
flutter pub add change_app_package_name
flutter pub run change_app_package_name:main com.yourdomain.yourapp

# 3. Replace all import references
# Search: flutter_riverpod_template → your_app_name

flutter clean && flutter pub get
```

### 2. Firebase setup

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Then call `Firebase.initializeApp()` in `main.dart` before `runApp`.

### 3. Regenerate translations

After editing files in `lib/i18n/`:

```bash
dart run slang
```

### 4. Hive initialisation

In `StartupService.initialize()` (called from `main.dart`):

```dart
await HiveStore.init();
```

---

## Constructor Injection Pattern

All services follow the same pattern — construct once, inject everywhere via Riverpod providers:

```dart
// Firestore
final firestoreServiceProvider = Provider(
  (ref) => FirestoreService(firestore: FirebaseFirestore.instance),
);

// Dio with auth + logging
final apiServiceProvider = Provider((ref) => DioService.withAuth(
  config: DioConfig(baseUrl: Env.apiBaseUrl),
  onRefreshToken: () => ref.read(authRepoProvider).refreshToken(),
));

// Connectivity
final connectivityProvider = Provider((_) => ConnectivityService());

// Secure store
final secureStoreProvider = Provider((_) => SecureStore());
```

---

## Best Practices Applied

- `AnnotatedRegion` for system UI — scoped per-route, no global `SystemChrome` calls
- `AuthInterceptor` queues concurrent 401s — a single token refresh retries all in-flight requests
- `AppLogger` is a no-op in release builds (`kDebugMode` guard)
- All services are injectable and mockable via constructor injection
- `HiveStore.openLazy` available for large datasets

---

*Maintained by Sh M Ahmer*
