# Warnell VR Lab App

Explore VR Forestry Education and Create Your Own VR Experiences!

The Warnell VR Lab App is part of the PERSEUS Project at the University of Georgia. Interns work to enhance forestry education through VR technology, promoting data-driven decisions and driving sustainable management from the Warnell School of Forestry and Natural Resources. Through this app, users can easily connect with lab materials, such as the headset checkout form and guidelines, to immerse themselves in forests and create their own experiences. They can also stay updated on the latest intern activities at the lab, such as research posters and new project developments, with an option to contact the lab directly using the provided contact form.

## Features

- **VR Materials**: Open the Warnell VR Lab YouTube channel, VR headset check-out and check-in forms, headset instructions, Unity development guide, and UGA Miller Learning Center technology lending policy. Failed or unavailable links display a retry message.
- **Posters and Publications**: Browse a chronological timeline of presentations and publications, including CURO 2026, a 2026 Purdue University conference, a 2026 Journal of Forestry brief communication, and the 2025 PERSEUS Annual Meeting. Publication links open in the external browser.
- **Intern Updates**: View the latest intern cohort, fieldwork, conference, drone, and 360-degree camera highlights. A card links to the Warnell VR Lab website, and the page includes updates on Percy, the lab's robot in development, plus PERSEUS Project funding and partner information.
- **Contact Form**: Validate name, email, and message fields, then prepare a feedback draft in the user's default email application. The form allows up to three messages per app session and clearly indicates that submission does not send the message directly.
- **Accessibility settings**: Support the device's **Dark Interface** preference or select System, Light, or Dark mode; adjust app-wide text size from `0.8x` to `2.0x`; and enable **Sufficient Contrast** colors throughout the app. Settings are available from every main app screen.
- **Responsive layouts**: Scrollable content, image sizing, flexible navigation cards, and text-aware icons support narrow phones, larger desktop windows, and high system text scales. Main app surfaces, controls, and route fallbacks are covered by widget tests.

## Built With

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [`url_launcher`](https://pub.dev/packages/url_launcher)
- [`visibility_detector`](https://pub.dev/packages/visibility_detector)

## Requirements

- Flutter SDK with Dart `3.12.2` or later within the SDK constraint in [`pubspec.yaml`](pubspec.yaml)
- A configured Flutter target such as Android, iOS, web, Windows, macOS, or Linux
- An email application configured on the device to use the Contact Form

Check the local Flutter installation before running the project:

```bash
flutter doctor
```

## Getting Started

Clone the repository and install its dependencies:

```bash
git clone <repository-url>
cd perseus_vr_lab_app
flutter pub get
```

Start the app on an available device or emulator:

```bash
flutter run
```

To choose a specific device, list the available targets and pass its identifier to `flutter run`:

```bash
flutter devices
flutter run -d <device-id>
```

## Testing

Run the widget and regression tests with:

```bash
flutter test
```

The test suite covers theme and contrast targets, system/theme selection, settings access, unknown-route handling, failed resource links, the Contact Form, PERSEUS footer theming, responsive button layouts, and text scaling from `200%` to `300%` across all main routes.

## Build Commands

Use the Flutter build command for the target you want to distribute:

```bash
flutter build apk       # Android
flutter build ios       # iOS, on macOS with Xcode configured
flutter build web       # Web
flutter build windows   # Windows
flutter build macos     # macOS, on macOS with Xcode configured
flutter build linux     # Linux
```

## Project Structure

```text
lib/
	main.dart                         App entry point, themes, settings, and routes
	screens/                          Feature pages
		home/                           Home navigation
		vr_materials/                   VR resources and external links
		posters_and_publications/       Research poster timeline
		intern_updates/                 Intern activity and project updates
		contact_form/                   Feedback form
		settings/                       Theme, text size, and contrast controls
	widgets/                          Reusable buttons, images, and theme controls
	utils/                            Shared colors and text-aware accessibility helpers
	assets/images/                    App and content images
test/                                Flutter widget and regression tests
```

## Notes

- Resource links and the Contact Form require internet access.
- The Contact Form opens the user's email client; it does not send messages directly from the app.
- Images are bundled from `lib/assets/images/` and declared in [`pubspec.yaml`](pubspec.yaml).

## Project Context

The app supports the Warnell VR Lab's work in forestry education, virtual reality development, and the PERSEUS Project. Content shown in the app includes research and project updates from the University of Georgia.
