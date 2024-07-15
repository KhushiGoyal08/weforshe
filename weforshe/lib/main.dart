import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weforshe/bindings/auth_binding.dart';
import 'package:weforshe/controller/auth/auth_controller.dart';
import 'package:weforshe/pages/auth_screen/login.dart';
import 'package:weforshe/pages/auth_screen/signup.dart';
import 'package:weforshe/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/', page: () => const AuthWrapper(), binding: AuthBinding()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
