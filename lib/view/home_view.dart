import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_app/controller/app_controller.dart';
import 'package:mvvm_app/model/state.dart';
import 'package:mvvm_app/view/user_detail_view.dart';

// ユーザリスト画面
class UserListPage extends ConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  static var controller = AppController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userStateProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Random User Info'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: users.when(
        data: (user) {
          return RefreshIndicator(
            child: ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                var fullName = user[index].name.title +
                    " " +
                    user[index].name.first +
                    " " +
                    user[index].name.last;
                return GestureDetector(
                  onTap: () {
                    controller.route(user[index], fullName, context);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                NetworkImage(user[index].picture.large),
                                radius: 24.0,
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fullName.toString(),
                                      style: const TextStyle(fontSize: 17.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      user[index].email.toString(),
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
              },
            ),
            onRefresh: () async {
              ref.refresh(userStateProvider);
            },
          );
        },
        error: (error, stackTrace) =>
            Center(
                child: Text(error.toString())
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}