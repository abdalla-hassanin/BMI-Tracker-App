import 'package:bmi_tracker_app/core/core_screen.dart';
import 'package:bmi_tracker_app/core/routing/routes.dart';
import 'package:bmi_tracker_app/features/app/presentation/pages/home_screen.dart';
import 'package:bmi_tracker_app/features/app/presentation/pages/result_screen.dart';
import 'package:bmi_tracker_app/features/auth/presentation/pages/login_screen.dart';
import 'package:bmi_tracker_app/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.coreScreen:
        return MaterialPageRoute(
          builder: (_) => const CoreScreen(),
        );
        case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.homeScreen:

        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case Routes.resultScreen:
        final double bmiResult = settings.arguments as double;
        return MaterialPageRoute(
          builder: (_) => ResultScreen(bmiResult: bmiResult),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
