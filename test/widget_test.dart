//import statements
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perseus_vr_lab_app/main.dart';
import 'package:perseus_vr_lab_app/screens/contact_form/contact_form.dart';
import 'package:perseus_vr_lab_app/widgets/custom_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

//regression test ensures that unknown routes do not surface unhandled exceptions
void main() {
  testWidgets('contact form explains that it opens an email app', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ContactFormPage()));

    expect(
      find.text(
        'Note: Submitting a form opens your default email app with a draft of this message.',
      ),
      findsOneWidget,
    );
    expect(find.text('Open Email App'), findsOneWidget);
  });

  testWidgets('unknown routes do not surface unhandled exceptions', (
    tester,
  ) async {
    await tester.pumpWidget(const WarnellVRLab());

    //navigate to an unknown route and verify that no unhandled exceptions are thrown
    final context = tester.element(find.text('Warnell VR Lab'));
    Navigator.of(context).pushNamed('/missing-route');

    //wait for the navigation to complete and verify that no unhandled exceptions are thrown
    await tester.pumpAndSettle();

    //verify that no unhandled exceptions are thrown
    expect(tester.takeException(), isNull);
  });

  //regression test ensures that the settings button is available on each screen of the app
  testWidgets('settings button is available on each screen', (tester) async {
    await tester.pumpWidget(const WarnellVRLab());

    //list of routes to test based on screens in the app
    final routes = [
      '/',
      '/vr_materials',
      '/posters_and_publications',
      '/intern_updates',
      '/contact_form',
    ];

    //loop through each route and verify that the settings button is available on each screen
    for (final route in routes) {
      await tester.pumpWidget(const WarnellVRLab());
      final context = tester.element(find.text('Warnell VR Lab'));
      Navigator.of(context).pushNamed(route);
      await tester.pumpAndSettle();

      expect(find.byTooltip('Open settings'), findsOneWidget);
      expect(find.byTooltip('Switch to dark mode'), findsNothing);
      expect(find.byTooltip('Switch to light mode'), findsNothing);
    }
  });

  testWidgets('theme can only be toggled from settings', (tester) async {
    await tester.pumpWidget(const WarnellVRLab());

    expect(find.byTooltip('Switch to dark mode'), findsNothing);
    await tester.tap(find.byTooltip('Open settings'));
    await tester.pumpAndSettle();

    final themeSwitch = find.widgetWithText(SwitchListTile, 'Theme');
    expect(tester.widget<SwitchListTile>(themeSwitch).value, isFalse);
    await tester.tap(find.text('Light mode is enabled'));
    await tester.pumpAndSettle();

    expect(tester.widget<SwitchListTile>(themeSwitch).value, isTrue);
    expect(find.text('Dark mode is enabled'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('failed resource links show a message instead of throwing', (
    tester,
  ) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    addTearDown(
      () => VisibilityDetectorController.instance.updateInterval =
          const Duration(milliseconds: 500),
    );

    const launcherChannel = MethodChannel('plugins.flutter.io/url_launcher');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(launcherChannel, (call) async => false);
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(launcherChannel, null),
    );

    await tester.pumpWidget(const WarnellVRLab());
    final context = tester.element(find.text('Warnell VR Lab'));
    Navigator.of(context).pushNamed('/vr_materials');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Visit the YouTube channel'));
    await tester.pumpAndSettle();

    expect(
      find.text("Couldn't open this link. Please try again."),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'Intern Updates website link shows an error when it cannot open',
    (tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
      addTearDown(
        () => VisibilityDetectorController.instance.updateInterval =
            const Duration(milliseconds: 500),
      );

      const launcherChannel = MethodChannel('plugins.flutter.io/url_launcher');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(launcherChannel, (call) async => false);
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(launcherChannel, null),
      );

      await tester.pumpWidget(const WarnellVRLab());
      final context = tester.element(find.text('Warnell VR Lab'));
      Navigator.of(context).pushNamed('/intern_updates');
      await tester.pumpAndSettle();

      expect(
        find.text('Stay up to date with the Warnell VR Lab'),
        findsOneWidget,
      );
      await tester.tap(find.text('Visit the VR Lab website'));
      await tester.pumpAndSettle();

      expect(
        find.text("Couldn't open this link. Please try again."),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    },
  );

  //regression test ensures that the custom button handles long labels without overflow
  testWidgets('custom button handles long labels without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 280,
              child: CustomButton(
                text: 'Posters and Publications',
                icon: Icons.newspaper,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    expect(find.text('Posters and Publications'), findsOneWidget);
    expect(tester.getSize(find.byType(CustomButton)).height, 58);
    expect(tester.takeException(), isNull);
  });

  testWidgets('custom button scales up on wide layouts', (tester) async {
    tester.view.physicalSize = const Size(1024, 768);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const WarnellVRLab());

    final homeButton = find.byType(CustomButton).first;
    expect(tester.getSize(homeButton).width, 752);
    expect(tester.getSize(homeButton).height, 72);
    expect(tester.takeException(), isNull);
  });
}
