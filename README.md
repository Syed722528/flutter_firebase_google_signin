# Flutter Firebase Auth

A Flutter application demonstrating email/password authentication and Google Sign-In using Firebase Authentication.

## Features

- Email and password authentication
- Google Sign-In integration
- Clean and intuitive user interface
- Secure authentication flow
- Persistent user sessions

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Firebase project set up in Firebase Console
- Android Studio / Xcode for native platform development

## Getting Started

### Firebase Setup

1. Create a new Firebase project in the [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication and set up the sign-in methods:
   - Email/Password
   - Google Sign-In

### Android Configuration

1. Register your app in Firebase Console and download `google-services.json`
2. Place the file in `android/app/`
3. Ensure your `android/build.gradle` has the Google services plugin
4. Add your SHA-1 and SHA-256 fingerprints to Firebase Console for Google Sign-In

### iOS Configuration

1. Register your app in Firebase Console and download `GoogleService-Info.plist`
2. Place the file in `ios/Runner/` using Xcode
3. Update your `Info.plist` with necessary Google Sign-In configurations
4. Configure your iOS URL schemes in Xcode

## Installation

1. Clone the repository
```bash
git clone https://github.com/Syed722528/flutter_firebase_google_signin.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Firebase Configuration Files

Make sure to add your own Firebase configuration files:
- Android: `google-services.json`
- iOS: `GoogleService-Info.plist`

**Note:** These files are not included in the repository for security reasons. You'll need to add them from your own Firebase project.

## Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Syed Hassan - [LinkedIn](https://www.linkedin.com/in/syed-hassan-abrar-11713a1b0/)

Contact: [Send me an Email](mailtto:shibrar28@gmail.com)