import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/utils/validators.dart';
import 'package:tumbler/views/auth/components/auth_button.dart';
import 'package:tumbler/views/auth/components/auth_form_field.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              "Register",
              style: TextStyle(
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),
            Text(
              "Please create an account to continue",
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            // ini buat button nya
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthFormField(
                    controller: _nameController,
                    label: "Full Name",
                    hintText: "Enter your full name",
                    validator: Validators.validateFullName,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your pasword",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _confirmpasswordController,
                    label: "confirm Password",
                    hintText: "Enter your pasword",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility),
                    validator: (value) => Validators.validateConfirmPassword(
                      value,
                      _confirmpasswordController.text
                    ),
                  ),
                  SizedBox(height: 50),
                  AuthButton(
                    text: "sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                        
                      }
                    }, 
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have an Account?",
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: Text("Sign in"),
                        )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
