//import statements
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perseus_vr_lab_app/main.dart';

//regression test ensures that unknown routes do not surface unhandled exceptions
void main() {
  testWidgets('unknown routes do not surface unhandled exceptions', (tester) async {
    await tester.pumpWidget(const WarnellVRLab());

    final context = tester.element(find.text('Warnell VR Lab'));
    Navigator.of(context).pushNamed('/missing-route');

    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
