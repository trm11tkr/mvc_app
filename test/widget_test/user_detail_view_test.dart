import 'package:flutter_test/flutter_test.dart';
import 'package:mvc_app/view/user_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:mvc_app/model/user.dart';

void main() {
  final name = Name(title: 'mr', first: 'test', last: 'user');
  final user = User(gender: 'man', email: 'sample@example.com', name: name);

  testWidgets('Widget test of userDetail', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: UserDetail(user: user),
      )
    );

    expect(find.text('mr test user'), findsOneWidget);
    expect(find.text('sample@example.com'), findsOneWidget);
  });
}