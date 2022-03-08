import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvc_app/model/state.dart';
import 'package:mvc_app/model/user.dart';
import 'package:mvc_app/view/user_detail_view.dart';

class AppController {
  route(User user, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserDetail(user)
      ),
    );
  }
  refresh(WidgetRef ref) {
    ref.refresh(userStateProvider);
  }
}

