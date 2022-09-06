import 'package:flutter/material.dart';
import 'package:flutter_auth_api/controllers/auth_controllers.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthControllers authControllers = AuthControllers();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                authControllers.loginRequest();
              },
              child: const Text('Login With API'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                authControllers.registerRequest();
              },
              child: const Text('Register With API'),
            ),
          ),
        ],
      ),
    );
  }
}
