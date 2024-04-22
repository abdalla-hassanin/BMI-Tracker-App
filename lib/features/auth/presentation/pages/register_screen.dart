import 'package:bmi_tracker_app/core/routing/routes.dart';
import 'package:bmi_tracker_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:bmi_tracker_app/features/auth/presentation/widgets/app_text_button.dart';
import 'package:bmi_tracker_app/features/auth/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void submitForm() async {
      if (formKey.currentState!.validate()) {
        String name = nameController.text.trim();
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        try {
          await authProvider.registerUser(email, password, name);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration successful'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          // Navigate back to login screen
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
        } catch (error) {
          // Handle registration error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to register. Please try again.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFormField(
                controller: nameController,
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
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
                buttonText: 'Register',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
