import 'package:bmi_tracker_app/core/routing/routes.dart';
import 'package:bmi_tracker_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:bmi_tracker_app/features/auth/presentation/widgets/app_text_button.dart';
import 'package:bmi_tracker_app/features/auth/presentation/widgets/app_text_form_field.dart';
import 'package:bmi_tracker_app/features/auth/presentation/widgets/do_not_have_account_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void submitForm() async {
      if (formKey.currentState!.validate()) {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();
        try {
          await authProvider.signInUser(email, password).then((value){
           Navigator.pushNamedAndRemoveUntil(
               context, Routes.homeScreen, (context) => false,arguments:value);
         });
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Failed to sign in. Please try again.')));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        title: const Text(
          'BMI Pro App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFormField(
                controller: emailController,
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              AppTextFormField(
                controller: passwordController,
                hintText: 'Password',
                isObscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              AppTextButton(
                buttonText: 'Login',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) submitForm();
                },
              ),
              const SizedBox(height: 8.0),
              const DoNotHaveAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
