import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user.dart';

// Userタップ時に詳細表示画面
class UserDetail extends StatelessWidget {
  final User user;
  final String fullName;
  UserDetail(this.user, this.fullName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.last.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                  NetworkImage(user.picture.large),
                  radius: 100.0,
                ),
                Flexible(
                  child: Text(
                    fullName.toString(),
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ),
                Text(
                  user.gender.toString(),
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueGrey
                  ),
                ),
                Flexible(
                  child: Text(
                    user.email.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}