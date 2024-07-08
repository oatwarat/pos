import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pos/src/modules/pos/pos_view.dart';
import 'package:provider/provider.dart';
import 'package:pos/src/data/models/pos_view_model.dart';

void main() {
  testWidgets('PosView has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => PosViewModel(),
        child: const MaterialApp(
          home: PosView(),
        ),
      ),
    );

    final titleFinder = find.text('TCC POS');
    final buttonFinder = find.text('กลับ');

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });
}
