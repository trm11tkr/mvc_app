import 'package:flutter/material.dart';
import 'package:mvc_app/controller/app_controller.dart';

import '../model/user.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    Key? key, required this.controller, required this.user, required this.circle}
    ) : super(key: key);
  final controller;
  final circle;
  final User user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await controller.route(user, context);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Row(
                children: [
                  circle,
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
