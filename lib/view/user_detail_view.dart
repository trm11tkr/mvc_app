import 'package:flutter/material.dart';
import 'package:mvc_app/model/user.dart';

// Userタップ時に詳細表示画面
class UserDetail extends StatelessWidget {
  const UserDetail({required this.user ,Key? key}) : super(key: key);
  final User user;


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
                  backgroundImage: backgroundImage(user.picture),
                  radius: 100,
                ),
                Flexible(
                  child: Text(
                    user.fullName.toString(),
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
  ImageProvider backgroundImage(Picture? picture) {
    if(picture != null) {
      return NetworkImage(picture.large);
    } else {
      return const AssetImage('assets/images/Image_at_null.jpg');
    }
  }
}