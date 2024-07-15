import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weforshe/controller/auth/auth_controller.dart';
import 'package:weforshe/pages/auth_screen/login.dart';
import 'package:weforshe/pages/homepage.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final AuthController authController = Get.find<AuthController>();
      return authController.isSignedIn.value ? HomeScreen() : LoginScreen();
    });
  }
}