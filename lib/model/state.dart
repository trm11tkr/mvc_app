import 'package:mvvm_app/model/user.dart';
import 'package:mvvm_app/controller/api_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = FutureProvider<List<User>>((ref) async {
  return fetchUsers();
});