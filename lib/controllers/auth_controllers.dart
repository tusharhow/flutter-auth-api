import 'dart:convert';
import '../models/login_response.dart';
import 'package:http/http.dart' as http;
import '../models/register_response.dart';


class AuthControllers {
  static const login = "https://reqres.in/api/login";
  static const register = "https://reqres.in/api/register";

  // login
  Future<LoginResponse> loginRequest() async {
    var response = await http.post(Uri.parse(login), body: {
      "email": 'eve.holt@reqres.in',
      "password": 'cityslicka',
    });
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login!');
    }
  }

  // register
  Future<RegisterResponse> registerRequest() async {
    var response = await http.post(Uri.parse(register), body: {
      "email": 'eve.holt@reqres.in',
      "password": 'pistol',
    });
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register!');
    }
  }
}
