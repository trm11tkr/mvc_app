import 'package:flutter_test/flutter_test.dart';
import 'package:mvc_app/model/api_request.dart';
import 'package:mvc_app/model/user.dart';

void main() {
  test("Parse user data",() {
    const json = '''
      {
        "results": [
          {
            "gender": "male",
            "name": {
              "title": "mr",
              "first": "flutter",
              "last": "man"
            },
            "email": "flutter.man@example.com",
            "picture": {
              "large": "https:~",
              "medium": "https:~",
              "thumbnail": "https:~"
            }
          },
          {
            "gender": "female",
            "name": {
              "title": "ms",
              "first": "flutter",
              "last": "woman"
            },
            "email": "flutter.woman@example.com",
            "picture": {
              "large": "https:~",
              "medium": "https:~",
              "thumbnail": "https:~"
            }
          }
        ]
      }
    ''';

    final user = parseUsers(json);

    expect(user[0].gender, "male");
    expect(user[0].name.first, "flutter");

    expect(user[1].gender, "female");
    expect(user[1].picture!.thumbnail, "https:~");

  });

  test('api_request', () async {
    // ここのチェックの仕方が甘い？
    final List<User> userList = await fetchUsers();
    expect(userList, isNotNull);
    expect(userList.length, 20);
  });
}