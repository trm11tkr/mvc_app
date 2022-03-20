import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mvc_app/model/user.dart';
import 'package:mvc_app/view/user_list_view.dart';

void main() {
  final name = Name(title: 'mr', first: 'test', last: 'user');
  final userWithoutPicture = User(gender: 'man', email: 'sample@example.com', name: name);

  final userWithPicture = User(gender: 'man', email: 'sample@example.com', name: name, );

  testWidgets('Widget test of userListView', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListView(controller: testAppController(), user: userWithoutPicture),
          )
        )
    );

    expect(find.text('mr test user'), findsOneWidget);
    expect(find.text('sample@example.com'), findsOneWidget);
  });
}

testAppController() {
  route(User user, BuildContext context) {}
  refresh(ref) {}
}