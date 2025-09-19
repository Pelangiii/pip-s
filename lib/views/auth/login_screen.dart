import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/utils/validators.dart';
import 'package:tumbler/views/auth/components/auth_button.dart';
import 'package:tumbler/views/auth/components/auth_form_field.dart';
import 'package:tumbler/views/auth/components/sosial_auth_button.dart';

class LoginScreen extends StatelessWidget {
  // fungsinya untuk memanggil sebuah validator dari setiap form
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              "Welcome Back",
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
                    hintText: "Enter your Email",
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text("forgot Password?")
                      ),
                  ),
                  SizedBox(height: 20),
                  AuthButton(
                    text: "sign in", 
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                      }
                    }, 
                    textColor: Colors.white, 
                    backgroundColor: primaryColor
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: textColor,
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: textColor
                              ),
                            ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: textColor,
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SocialAuthButton(
                      assetIcon: "assets/icons/google_logo.svg", 
                      label: "Sign in with Google", 
                      backgroundColor: Colors.white, 
                      foregroundColor: Colors.black,
                      onPressed: () {},
                      ),
                    SizedBox(height: 20),
                    SocialAuthButton(
                      assetIcon: "assets/icons/appel_logo.svg", 
                      label: "Sign in with appel", 
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0), 
                      foregroundColor: const Color.fromARGB(255, 255, 254, 254),
                      onPressed: () {},
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't Have an account",
                            style: TextStyle(
                              color: textColor
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/register'),
                            child: Text("Register"),
                             ),
                        ],
                      )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}