import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/state.dart';
import '../model/user.dart';
import '../view/user_detail_view.dart';

class AppController {
  route(User user, String fullName, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserDetail(user, fullName)
      ),
    );
  }
}

// 画面を下に引っ張る動作
refresh(WidgetRef ref) async {
  ref.refresh(userStateProvider);
}