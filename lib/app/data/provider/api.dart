import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:stealth_startup_technical_exam/app/data/models/user.dart';
import 'package:stealth_startup_technical_exam/core/values/constants.dart';

class MyApi extends GetConnect {
  Future<List<User>> getUsers() async {
    try {
      final res = await get(
        getUsersUrl,
      );

      return List<User>.from(
          json.decode(res.body).map((user) => User.fromJson(user)));
    } catch (e) {
      return [];
    }
  }
}
