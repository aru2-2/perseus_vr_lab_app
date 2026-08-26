# Warnell VR Lab App

Explore VR Forestry Education and Create Your Own VR Experiences!

The Warnell VR Lab App is part of the PERSEUS Project at the University of Georgia. Interns work to enhance forestry education through VR technology, promoting data-driven decisions and driving sustainable management from the Warnell School of Forestry and Natural Resources. Through this app, users can easily connect with lab materials, such as the headset checkout form and guidelines, to immerse themselves in forests and create their own experiences. They can also stay updated on the latest intern activities at the lab, such as research posters and new project developments, with an option to contact the lab directly using the provided contact form.

## Features

- **VR Materials**: Open the Warnell VR Lab YouTube channel, VR headset checkout form, headset instructions, Unity development guide, and UGA Miller Learning Center technology lending policy.
- **Posters and Publications**: Browse a timeline of Warnell VR Lab presentations and research posters.
- **Intern Updates**: View updates and images from PERSEUS Project interns, including information about fieldwork, conferences, drone data collection, and 360-degree imagery.
- **Contact Form**: Validate and prepare feedback in the user's default email application. The form allows up to three messages per app session.
- **Accessibility settings**: Switch between light and dark themes, adjust app-wide text size from `0.8x` to `1.4x`, and enable higher contrast colors.
- **Responsive layouts**: Scrollable content and flexible controls support small screens as well as larger desktop and web windows.

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

The current test suite covers unknown-route handling, settings access from the primary screens, and long button labels on a narrow viewport.

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
	utils/                            Shared colors
	assets/images/                    App and content images
test/                                Flutter widget and regression tests
```

## Notes

- Resource links and the Contact Form require internet access.
- The Contact Form opens the user's email client; it does not send messages directly from the app.
- Images are bundled from `lib/assets/images/` and declared in [`pubspec.yaml`](pubspec.yaml).

## Project Context

The app supports the Warnell VR Lab's work in forestry education, virtual reality development, and the PERSEUS Project. Content shown in the app includes research and project updates from the University of Georgia.
