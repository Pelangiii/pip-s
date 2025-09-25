import 'package:flutter/material.dart';
// import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/utils/validators.dart';
// import 'package:tumbler/views/auth/components/auth_button.dart';
// import 'package:tumbler/views/auth/components/auth_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/catalogue');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/drinkware/bgps.png"), 
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(255, 39, 39, 39),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Konten utama
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Logo
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/drinkware/PiplogoWhite.png",
                        height: 120,
                      ),
                      const SizedBox(height: 12),
                      // 
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildWhiteFormField(
                          controller: _emailController,
                          label: "E-mail",
                          hintText: "E-mail",
                          validator: Validators.validateEmail,
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),

                        _buildWhiteFormField(
                          controller: _passwordController,
                          label: "Password",
                          hintText: "Password",
                          obscureText: true,
                          validator: Validators.validatePassword,
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(height: 20),

                        _buildWhiteFormField(
                          controller: _confirmPasswordController,
                          label: "Confirm Password",
                          hintText: "Confirm Your Password",
                          obscureText: true,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                            value,
                            _passwordController.text,
                          ),
                          icon: Icons.lock_outline,
                        ),

                        const SizedBox(height: 40),

                        // Tombol Register dengan animasi loading
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _isLoading ? 60 : double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: _isLoading ? null : _handleRegister,
                            child: _isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Text(
                                    "Register",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Text login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "you have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: const Text(
                          "Login Now!",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Custom TextField dengan border putih + shadow
  Widget _buildWhiteFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
    IconData? icon,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
