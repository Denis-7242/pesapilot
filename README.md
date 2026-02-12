## PesaPilot

PesaPilot is a fintech-grade money management app with a clean, trust-focused onboarding and authentication experience built in Flutter (Material 3).

### Features

- **Onboarding / Splash**
  - Branded wallet logo with notification badge
  - App name `PesaPilot` and tagline “Take control of your money.”
  - Primary green **Get Started** CTA
  - Terms & Privacy disclaimer footer

- **Sign In**
  - Circular back button with soft shadow
  - Email + password fields with icons
  - Password visibility toggle state
  - “Forgot Password?” link and reCAPTCHA notice
  - Primary green **Sign In** CTA

- **Sign Up**
  - Full name, email, password, confirm password fields
  - Matching layout and styling with Sign In
  - reCAPTCHA protection notice
  - Primary green **Sign Up** CTA

All screens are:
- Fully responsive across screen sizes
- Keyboard-safe (no overflow when typing)
- Centered with constrained width for large displays

### Tech stack

- **Framework**: Flutter (Material 3)
- **Language**: Dart
- **Architecture**: Feature-based folder structure

Key structure:

- `lib/app.dart` – root `MaterialApp` and theme
- `lib/core/theme/` – colors, text styles, app theme
- `lib/core/widgets/` – `PrimaryButton`, `AuthTextField`, `BackButtonCircle`
- `lib/features/auth/presentation/screens/` – `Onboarding`, `SignIn`, `SignUp`
- `lib/features/auth/presentation/widgets/` – `AuthFooter`, `ForgotPassword`

### Getting started

1. Install Flutter (3.x).
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

The default entrypoint loads the **Onboarding** screen and lets you navigate through **Sign In** and **Sign Up**.
The authentication is yet to be implemented.
