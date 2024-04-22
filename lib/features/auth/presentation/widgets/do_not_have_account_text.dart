import 'package:bmi_tracker_app/core/routing/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextSpan(
              text: ' Sign Up',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.indigo
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(
                      context, Routes.registerScreen);
                }),
        ],
      ),
    );
  }
}
