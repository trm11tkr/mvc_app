import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_app/view/build_view.dart';

void main() async {
  runApp(
      const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //VisualDensity により視覚的な詰まり具合(密度)を調整
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UserListPage(),
    );
  }
}