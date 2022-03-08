import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvc_app/model/user.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Row(
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName.toString(),
                          style: const TextStyle(fontSize: 17.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          user.email.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {

  final Name name = Name(title: 'mr', first: 'first', last: 'name');
  final User user = User(gender: 'man', email: 'email', name: name);


  testWidgets('ListTitle element test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: UserListView(user: user)),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('mr first name'), findsOneWidget);
    expect(find.text('email'), findsOneWidget);
  });
}