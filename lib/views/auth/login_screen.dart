import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/views/auth/components/auth_form_field.dart';

class LoginScreen extends StatelessWidget {
  //fungsinya untuk manggil sebuah validator dari sebuah form
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter a form to login to this app",
              style: TextStyle(
                fontSize: 16,
                color: textColor
              ),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthFormField(
                    controller: _emailController, 
                    label: "Email", 
                    hintText: "Enter your email",
                    validator: Validators.validateEmail,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }