import 'package:flutter/material.dart';
import 'package:linkedin/presentation/view/login_screen.dart';
import 'package:linkedin/presentation/view/signup_screen.dart';
import 'package:linkedin/presentation/view/splash_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case 'loginScreen':
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case 'signupScreen':
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupScreen());

      default:
        return null;
    }
  }
}
