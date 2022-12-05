import 'package:flutter/material.dart';
import 'package:flutter_auth_api/controllers/auth_controllers.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthControllers>(
          init: AuthControllers(),
          builder: (authControllers) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                authControllers.isLoading
                    ? const CircularProgressIndicator()
                    : Center(
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
                authControllers.isLoadingSecond
                    ? const CircularProgressIndicator()
                    : Center(
                        child: ElevatedButton(
                          onPressed: () {
                            authControllers.registerRequest();
                          },
                          child: const Text('Register With API'),
                        ),
                      ),
              ],
            );
          }),
    );
  }
}
