import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weforshe/controller/auth/auth_controller.dart';
import 'package:weforshe/utils/custom/custom_button.dart';
import 'package:weforshe/utils/custom/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title:const   Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: emailController, label: 'Email'),
            CustomTextField(controller: passwordController, label: 'Password', obscureText: true),
          const   SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () {
                authController.login(emailController.text, passwordController.text);
              },
            ),
            TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
