import 'dart:convert';
import 'package:get/get.dart';

import '../models/login_response.dart';
import 'package:http/http.dart' as http;
import '../models/register_response.dart';

class AuthControllers extends GetxController {
  static const login = "https://reqres.in/api/login";
  static const register = "https://reqres.in/api/register";

  bool isLoading = false;
  bool isLoadingSecond = false;

  // login
  Future<LoginResponse> loginRequest() async {
    isLoading = true;
    update();
    var response = await http.post(Uri.parse(login), body: {
      "email": 'eve.holt@reqres.in',
      "password": 'pistol',
    });
    isLoading = false;
    update();
    if (response.statusCode == 200) {
      print(response.body);
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Login Failed');
    }
  }

  // register
  Future<RegisterResponse> registerRequest() async {
    isLoadingSecond = true;
    update();
    var response = await http.post(Uri.parse(register), body: {
      "email": 'eve.holt@reqres.in',
      "password": 'pistol',
    });
    isLoadingSecond = false;
    update();
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register!');
    }
  }
}
