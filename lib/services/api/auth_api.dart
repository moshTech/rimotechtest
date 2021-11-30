import 'package:flutter/material.dart';
import 'package:rimotest/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:rimotest/models/error_model.dart';
import 'dart:convert';

import 'package:rimotest/models/signin_model.dart';

class AuthApi {
  Future signIn({email, password}) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var _map = <String, dynamic>{};
    _map["email"] = email;
    _map["password"] = password;

    try {
      final response = await http.post(Uri.parse(AppConfig.signIn),
          body: jsonEncode(_map), headers: requestHeaders);
      debugPrint(AppConfig.signIn);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint(jsonDecode(response.body)['status'].toString());
        return signInModelFromJson(response.body);
      } else {
        return errorModelFromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
