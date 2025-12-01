import 'package:flutter/material.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_form.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_header.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_success_dialog.dart';
import 'package:sji_mobile/feature/home/page/home.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? selectedCountry;

  void _handleRegister() {
    if (_emailController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        selectedCountry == null) {
      _showSnackBar('Please fill in all fields');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar('Passwords do not match');
      return;
    }

    if (!_isStrongPassword(_passwordController.text)) {
      _showSnackBar('Please choose a stronger password (min. 8 characters with uppercase, lowercase, and numbers/special characters)');
      return;
    }

    _showSuccessDialog();
  }

  bool _isStrongPassword(String password) {
    if (password.length < 8) return false;
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    if (!password.contains(RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF2D1B69),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessDialog(
          email: _emailController.text,
          onGetStarted: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D1B69),
      body: SafeArea(
        child: Column(
          children: [
            RegisterHeader(
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: RegisterForm(
                emailController: _emailController,
                usernameController: _usernameController,
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
                obscurePassword: _obscurePassword,
                obscureConfirmPassword: _obscureConfirmPassword,
                selectedCountry: selectedCountry,
                onPasswordVisibilityChanged: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                onConfirmPasswordVisibilityChanged: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                onCountryChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                },
                onRegister: _handleRegister,
              ),
            ),
          ],
        ),
      ),
    );
  }
}