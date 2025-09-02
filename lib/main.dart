import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'reset_password_page.dart';
import 'home_page.dart';

//---------------------------------------------------------
void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/reset': (context) => ResetPasswordPage(),
        '/home': (context) => HomePage(), //
      },
    );
  }
}
