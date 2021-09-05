import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/models/user.dart';

class UserRepositories {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static String baseUrl = "http://192.168.137.1:3000/api";
  var loginUrl = '$baseUrl/users/login';
  User? currentUser;
  // UserRepositories() {
  //   _storage.delete(key: "user");
  //   _storage.deleteAll();
  // }
  Future<User> getCurrentUser() async {
    return User.fromJson(await _storage.read(key: "user"));
  }

  Future<bool> hasUser() async {
    var value = await _storage.read(key: "user");
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persisteUser(String user) async {
    //SAVE THE USER INSTANCE
    await _storage.write(key: "user", value: user);
  }

  //!IF YOU DECIDE TO UPDATE THIS LATTER THEN CALL CURRENT USER DELETE THE KEY FIRST
  Future<void> deleteUser() async {
    await _storage.delete(key: "user");
    await _storage.deleteAll();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    print("POST $loginUrl");
    //! DOESNT CATCH SHIT!!!! DONT TRUST IT;
    Map<String, String> res;
    try {
      var response = await Dio()
          .post(loginUrl, data: {'email': email, 'password': password});
      var responseBody = response.data;
      return {
        "body": json.encode(responseBody),
        "status": response.statusCode.toString(),
        "message": responseBody["message"]
      };
    } catch (e) {
      print(e);
      return {"status": "404", "message": "Wrong URL godamit!"};
    }
  }
}
