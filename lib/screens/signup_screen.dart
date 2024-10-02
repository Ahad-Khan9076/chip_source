import 'package:chip_source/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // State variables to manage visibility of passwords
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // To store phone number and selected role
  String? phoneNumber;
  String? selectedRole;

  // List of roles for dropdown
  final List<String> roles = ['Seller', 'Buyer', 'Admin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // App Title or Header
              Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Join us and get started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.brown[600],
                ),
              ),
              const SizedBox(height: 30),

              // Name TextField
              _buildTextField(controller: nameController, label: 'Name', icon: Icons.person),

              // Email TextField
              const SizedBox(height: 20),
              _buildTextField(controller: emailController, label: 'Email', icon: Icons.email),

              // Phone Number Field with Country Code
              const SizedBox(height: 20),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(),
                  ),
                  prefixIcon: Icon(Icons.phone, color: Colors.brown[400]),
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  setState(() {
                    phoneNumber = phone.completeNumber; // Store the full phone number with country code
                  });
                },
              ),

              // Age TextField
              const SizedBox(height: 20),
              _buildTextField(controller: ageController, label: 'Age', icon: Icons.cake),

              // Postal Code TextField
              const SizedBox(height: 20),
              _buildTextField(controller: postalCodeController, label: 'Postal Code', icon: Icons.local_post_office),

              // City TextField
              const SizedBox(height: 20),
              _buildTextField(controller: cityController, label: 'City', icon: Icons.location_city),

              // State TextField
              const SizedBox(height: 20),
              _buildTextField(controller: stateController, label: 'State', icon: Icons.map),

              // Province TextField
              const SizedBox(height: 20),
              _buildTextField(controller: provinceController, label: 'Province', icon: Icons.location_on),

              // Role Dropdown with reduced width
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft, // Align dropdown to the left side
                child: Container(
                  width: 400, // Set dropdown width smaller
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown[400]!),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedRole,
                      hint: Text(
                        'Select Role',
                        style: TextStyle(color: Colors.brown[400]),
                      ),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.brown[400]),
                      items: roles.map((String role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Text(
                            role,
                            style: TextStyle(color: Colors.brown[800]),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedRole = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),

              // Password TextField with visibility toggle
              const SizedBox(height: 20),
              _buildPasswordTextField(
                controller: passwordController,
                label: 'Password',
                isPasswordVisible: _isPasswordVisible,
                onToggleVisibility: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),

              // Confirm Password TextField with visibility toggle
              const SizedBox(height: 20),
              _buildPasswordTextField(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                isPasswordVisible: _isConfirmPasswordVisible,
                onToggleVisibility: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),

              const SizedBox(height: 30),

              // Signup Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement signup logic here
                    Get.snackbar("Signup", "Account created successfully!",
                        icon: Icon(Icons.done,color: Colors.green,),
                        snackPosition: SnackPosition.TOP,);
                    Get.to(LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a standard text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.brown[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Helper method to build a password text field with toggle visibility
  Widget _buildPasswordTextField({
    required TextEditingController controller,
    required String label,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.lock, color: Colors.brown[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.brown[400],
          ),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}
