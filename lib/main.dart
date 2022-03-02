import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_app/controller/api_request.dart';
import 'package:mvvm_app/model/state.dart';
import 'package:mvvm_app/model/user.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserDetail(user[index], fullName)),
                        );
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
              Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

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
