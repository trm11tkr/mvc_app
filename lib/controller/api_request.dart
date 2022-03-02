import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:mvvm_app/model/user.dart';

List parseUsers(String responseBody) {
  var list = json.decode(responseBody)['results'] as List;
  List users = list.map((model) => User.fromJson(model)).toList();
  return users;
}

Future<List> fetchUsers() async {
  final url = Uri.parse('https://randomuser.me/api/?results=20');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(parseUsers, response.body);
  } else {
    throw Exception('Can\'t get users');
  }
}