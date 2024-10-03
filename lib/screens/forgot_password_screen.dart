import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  // Mock function to simulate sending a reset link
  void _sendResetLink() {
    final email = _emailController.text.trim();

    if (email.isNotEmpty) {
      Get.snackbar(
        'Reset Link Sent',
        'A reset link has been sent to $email',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
        icon: const Icon(Icons.check_circle, color: Colors.white),
      );

      _emailController.clear();
    } else {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFA1887F), Color(0xFF8D6E63)], // Earthy brown tones
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              color: const Color(0xFFD7CCC8), // Light beige color for the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_reset,
                      color: Colors.brown,
                      size: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Enter your email address to receive a password reset link',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4E342E), // Deep brown color for text
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Color(0xFF4E342E)), // Dark brown text color
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Color(0xFF4E342E)),
                        prefixIcon: const Icon(Icons.email, color: Color(0xFF4E342E)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.brown, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8D6E63), width: 1.5),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _sendResetLink,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 40.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: const Color(0xFF6D4C41), // Earthy brown button color
                      ),
                      child: const Text(
                        'Send Reset Link',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
