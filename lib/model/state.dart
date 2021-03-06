import 'package:mvc_app/model/user.dart';
import 'package:mvc_app/model/api_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateProvider = FutureProvider<List<User>>((ref) async {
  return fetchUsers();
});