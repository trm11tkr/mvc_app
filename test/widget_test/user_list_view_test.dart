import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mvc_app/model/user.dart';
import 'package:mvc_app/view/user_list_view.dart';

void main() {
  final name = Name(title: 'mr', first: 'test', last: 'user');
  final user = User(gender: 'man', email: 'sample@example.com', name: name);
  final circleImage = testCircleAvatar();

  testWidgets('Widget test of userListView', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListView(controller: testAppController(), user: user, circle: circleImage,),
          )
        )
    );

    expect(find.text('mr test user'), findsOneWidget);
    expect(find.text('sample@example.com'), findsOneWidget);
  });
}

Widget testCircleAvatar() {
  return Container(
    width: 40,
    height: 40,
    decoration: const BoxDecoration(
      color: Colors.red,
      shape: BoxShape.circle,
    ),
  );
}
testAppController() {
  route(User user, BuildContext context) {}
  refresh(ref) {}
}