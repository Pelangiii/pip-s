import 'package:flutter/material.dart';
import 'package:tumbler/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
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
                image: AssetImage("assets/images/drinkware/bgps.png"), // ganti sesuai asetmu
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
                      // const Text(
                      //   "GAMING STORE",
                      //   style: TextStyle(
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //     letterSpacing: 1.5,
                      //   ),
                      // ),
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

                        const SizedBox(height: 40),

                        // Tombol Login dengan animasi loading
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
                            onPressed: _isLoading ? null : _handleLogin,
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
                                    "Login",
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

                  const SizedBox(height: 30),

                  // Divider
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(color: Colors.white54, thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or continue with",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.white54, thickness: 1),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Login pakai Google & Apple
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialLoginButton(
                        icon: Icons.g_mobiledata,
                        label: "Google",
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                      const SizedBox(width: 20),
                      _socialLoginButton(
                        icon: Icons.apple,
                        label: "Apple",
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Text Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: const Text(
                          "Register Now!",
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
        hintStyle: TextStyle(color: Colors.white70),
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

  /// Tombol login sosial (Google / Apple)
  Widget _socialLoginButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: () {
        // nanti bisa diisi dengan logic login Google/Apple
      },
      icon: Icon(icon, size: 24),
      label: Text(label, style: TextStyle(fontSize: 16, color: textColor)),
    );
  }
}
