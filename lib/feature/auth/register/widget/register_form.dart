import 'package:flutter/material.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_confirm_password_field.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_country_dropdown.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_email_field.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_password_field.dart';
import 'package:sji_mobile/feature/auth/register/widget/register_username_field.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final String? selectedCountry;
  final VoidCallback onPasswordVisibilityChanged;
  final VoidCallback onConfirmPasswordVisibilityChanged;
  final Function(String?) onCountryChanged;
  final VoidCallback onRegister;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.selectedCountry,
    required this.onPasswordVisibilityChanged,
    required this.onConfirmPasswordVisibilityChanged,
    required this.onCountryChanged,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildWelcomeSection(),
            const SizedBox(height: 32),
            EmailField(controller: emailController),
            const SizedBox(height: 20),
            UsernameField(controller: usernameController),
            const SizedBox(height: 20),
            PasswordField(
              controller: passwordController,
              obscureText: obscurePassword,
              onVisibilityChanged: onPasswordVisibilityChanged,
            ),
            const SizedBox(height: 20),
            ConfirmPasswordField(
              controller: confirmPasswordController,
              obscureText: obscureConfirmPassword,
              onVisibilityChanged: onConfirmPasswordVisibilityChanged,
            ),
            const SizedBox(height: 20),
            CountryDropdown(
              selectedCountry: selectedCountry,
              onChanged: onCountryChanged,
            ),
            const SizedBox(height: 12),
            _buildInfoText(),
            const SizedBox(height: 32),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2D1B69),
                Color(0xFF6A4C93),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2D1B69).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.person_add_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Create your account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF2D1B69),
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Fill in your details to get started and access your agreements.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoText() {
    return Row(
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: const Color(0xFF2D1B69).withOpacity(0.6),
          size: 16,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "We'll use this information to personalize your experience",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2D1B69),
            Color(0xFF6A4C93),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2D1B69).withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onRegister,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(width: 2),
              Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}