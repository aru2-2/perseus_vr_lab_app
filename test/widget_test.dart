//import statements
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perseus_vr_lab_app/main.dart';
import 'package:perseus_vr_lab_app/widgets/custom_button.dart';

//regression test ensures that unknown routes do not surface unhandled exceptions
void main() {
  testWidgets('unknown routes do not surface unhandled exceptions', (tester) async {
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
      '/robot',
    ];

    //loop through each route and verify that the settings button is available on each screen
    for (final route in routes) {
      await tester.pumpWidget(const WarnellVRLab());
      final context = tester.element(find.text('Warnell VR Lab'));
      Navigator.of(context).pushNamed(route);
      await tester.pumpAndSettle();

      expect(find.byTooltip('Open settings'), findsOneWidget);
    }
  });

//regression test ensures that the custom button handles long labels without overflow
  testWidgets('custom button handles long labels without overflow', (tester) async {
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
    expect(tester.takeException(), isNull);
  });
}
