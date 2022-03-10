import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvc_app/controller/app_controller.dart';
import 'package:mvc_app/view/home_view.dart';

void main() async {
  // riverpod利用範囲指定
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC practice',
      theme: ThemeData(
        // テーマカラー指定
        primarySwatch: Colors.blue,
        // VisualDensity により視覚的な詰まり具合(密度)を調整
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ダークモードに対応
      darkTheme: ThemeData.dark(),
      home: UserListPage(controller: AppController(),),
    );
  }
}
