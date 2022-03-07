import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_app/controller/app_controller.dart';
import 'package:mvvm_app/model/state.dart';
import 'package:mvvm_app/view/user_list_view.dart';

// ユーザリスト画面
class UserListPage extends ConsumerWidget {
  const UserListPage({Key? key}) : super(key: key);

  static var controller = AppController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User Info'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: users.when(
        data: (user) {
          return RefreshIndicator(
            child: ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return UserListView(controller: controller, user: user[index]);
              },
            ),
            onRefresh: () async {
              await controller.refresh(ref);
            }
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