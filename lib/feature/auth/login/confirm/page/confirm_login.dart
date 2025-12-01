// import 'package:flutter/material.dart';
// import 'package:sji_mobile/core/styles/styles_color.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth/error_codes.dart' as auth_error;
// import 'package:sji_mobile/feature/home/page/home.dart';
// import 'package:flutter/services.dart'; 

// class EmailLogin extends StatefulWidget {
//   final String userEmail;
  
//   const EmailLogin({super.key, required this.userEmail});

//   @override
//   State<EmailLogin> createState() => _EmailLoginState();
// }

// class _EmailLoginState extends State<EmailLogin> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final LocalAuthentication _localAuth = LocalAuthentication();
  
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _isBiometricSupported = false;
//   bool _isLoading = false;
//   List<BiometricType> _availableBiometrics = [];

//   @override
//   void initState() {
//     super.initState();
//     _checkBiometricSupport();
//   }

//   Future<void> _checkBiometricSupport() async {
//     try {
//       final bool canAuthenticate = await _localAuth.canCheckBiometrics;
//       final bool isDeviceSupported = await _localAuth.isDeviceSupported();
      
//       setState(() {
//         _isBiometricSupported = canAuthenticate && isDeviceSupported;
//       });

//       if (_isBiometricSupported) {
//         _availableBiometrics = await _localAuth.getAvailableBiometrics();
//       }
//     } catch (e) {
//       print('Error checking biometric support: $e');
//       setState(() {
//         _isBiometricSupported = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2D1B69),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Modern header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFF2D1B69),
//                     Color(0xFF6A4C93),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   // Back button with modern design
//                   Container(
//                     width: 48,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.15),
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(
//                         color: Colors.white.withOpacity(0.3),
//                         width: 1,
//                       ),
//                     ),
//                     child: IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: const Icon(
//                         Icons.arrow_back_ios_new_rounded,
//                         size: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   // Title with improved typography
//                   const Expanded(
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: -0.5,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Main content area
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 24),
                      
//                       // Welcome section
//                       _buildWelcomeSection(),
                      
//                       const SizedBox(height: 10),
                      
//                       // Email display section
//                       _buildEmailDisplaySection(),
                      
//                       const SizedBox(height: 24),
                      
//                       // Password input field
//                       _buildPasswordField(),
                      
//                       const SizedBox(height: 24),
                      
//                       // Confirm Password input field
//                       _buildConfirmPasswordField(),
                      
//                       const SizedBox(height: 32),
                      
//                       // Login button with fingerprint
//                       _buildLoginButton(context),
                   
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildWelcomeSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Icon with gradient
//         Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [
//                 Color(0xFF2D1B69),
//                 Color(0xFF6A4C93),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFF2D1B69).withOpacity(0.3),
//                 blurRadius: 15,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: const Icon(
//             Icons.lock_person_rounded,
//             color: Colors.white,
//             size: 32,
//           ),
//         ),
        
//         const SizedBox(height: 24),
        
//         // Title
//         const Text(
//           "Login with your account",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w800,
//             color: Color(0xFF2D1B69),
//             letterSpacing: -1,
//           ),
//         ),
        
//         const SizedBox(height: 12),
        
//         // Description
//         Text(
//           "Enter your password and confirm password, then use fingerprint to login.",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey[700],
//             height: 1.6,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildEmailDisplaySection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Label
//         Padding(
//           padding: const EdgeInsets.only(left: 4, bottom: 8),
//           child: Text(
//             "EMAIL ADDRESS",
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               color: AppColors.darkGreyText,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
        
//         // Email display container
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: const Color(0xFF2D1B69).withOpacity(0.05),
//             border: Border.all(
//               color: const Color(0xFF2D1B69).withOpacity(0.2),
//               width: 2,
//             ),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   widget.userEmail.isEmpty ? "No email provided" : widget.userEmail,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF2D1B69),
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF2D1B69).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Text(
//                   "Verified",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF2D1B69),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
        
//         const SizedBox(height: 12),
        
//         // Info text
//         Row(
//           children: [
//             Icon(
//               Icons.info_outline_rounded,
//               color: const Color(0xFF2D1B69).withOpacity(0.6),
//               size: 16,
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Text(
//                 "This email will be used for your account login",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildPasswordField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Label
//         Padding(
//           padding: const EdgeInsets.only(left: 4, bottom: 8),
//           child: Text(
//             "PASSWORD",
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               color: AppColors.darkGreyText,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
        
//         // Text field
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.grey[50],
//             border: Border.all(
//               color: Colors.grey[200]!,
//               width: 2,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: TextField(
//             controller: passwordController,
//             obscureText: _obscurePassword,
//             decoration: InputDecoration(
//               hintText: 'Enter your password',
//               hintStyle: const TextStyle(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w400,
//               ),
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 20,
//               ),
//               prefixIcon: const Icon(
//                 Icons.lock_rounded,
//                 color: Color(0xFF2D1B69),
//                 size: 22,
//               ),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _obscurePassword = !_obscurePassword;
//                   });
//                 },
//                 icon: Icon(
//                   _obscurePassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
//                   color: const Color(0xFF2D1B69),
//                   size: 22,
//                 ),
//               ),
//             ),
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF2D1B69),
//             ),
//             cursorColor: const Color(0xFF2D1B69),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildConfirmPasswordField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Label
//         Padding(
//           padding: const EdgeInsets.only(left: 4, bottom: 8),
//           child: Text(
//             "CONFIRM PASSWORD",
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               color: AppColors.darkGreyText,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
        
//         // Text field
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.grey[50],
//             border: Border.all(
//               color: Colors.grey[200]!,
//               width: 2,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: TextField(
//             controller: confirmPasswordController,
//             obscureText: _obscureConfirmPassword,
//             decoration: InputDecoration(
//               hintText: 'Confirm your password',
//               hintStyle: const TextStyle(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w400,
//               ),
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 20,
//               ),
//               prefixIcon: const Icon(
//                 Icons.lock_outline_rounded,
//                 color: Color(0xFF2D1B69),
//                 size: 22,
//               ),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _obscureConfirmPassword = !_obscureConfirmPassword;
//                   });
//                 },
//                 icon: Icon(
//                   _obscureConfirmPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
//                   color: const Color(0xFF2D1B69),
//                   size: 22,
//                 ),
//               ),
//             ),
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Color(0xFF2D1B69),
//             ),
//             cursorColor: const Color(0xFF2D1B69),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLoginButton(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 60,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xFF2D1B69),
//             Color(0xFF6A4C93),
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF2D1B69).withOpacity(0.4),
//             blurRadius: 15,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           onTap: _isLoading ? null : _handleLogin,
//           child: Stack(
//             children: [
//               // Button content
//               Center(
//                 child: _isLoading
//                     ? const SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2,
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                         ),
//                       )
//                     : const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Log-in',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: -0.2,
//                             ),
//                           ),
//                         ],
//                       ),
//               ),
              
//               // Fingerprint icon on the right when not loading
            
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _handleLogin() async {
//   final password = passwordController.text.trim();
//   final confirmPassword = confirmPasswordController.text.trim();
  
//   // Validate password fields first
//   if (password.isEmpty) {
//     _showSnackBar(context, 'Please enter your password');
//     return;
//   }
  
//   if (confirmPassword.isEmpty) {
//     _showSnackBar(context, 'Please confirm your password');
//     return;
//   }
  
//   if (password != confirmPassword) {
//     _showSnackBar(context, 'Passwords do not match');
//     return;
//   }
  
//   if (!_isStrongPassword(password)) {
//     _showSnackBar(context, 'Please choose a stronger password');
//     return;
//   }

//   // Set loading state
//   setState(() {
//     _isLoading = true;
//   });

//   // Navigate directly to home page after a brief delay to show loading
//   await Future.delayed(const Duration(milliseconds: 500));
  
//   setState(() {
//     _isLoading = false;
//   });
  
//   _navigateToHomePage();
// }


//   Future<void> _authenticateWithFingerprintForLogin() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final bool didAuthenticate = await _localAuth.authenticate(
//         localizedReason: 'Scan your fingerprint to login to your account',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           stickyAuth: true,
//           sensitiveTransaction: true,
//           useErrorDialogs: true,
//         ),
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (didAuthenticate) {
//         // Fingerprint authentication successful - navigate directly to home
//         _navigateToHomePage();
//       } else {
//         _showSnackBar(context, 'Fingerprint authentication failed. Please try again.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
      
//       print('Fingerprint authentication error: $e');
      
//       // Handle specific errors
//       if (e is PlatformException) {
//         switch (e.code) {
//           case auth_error.lockedOut:
//             _showSnackBar(context, 'Too many failed attempts. Try again later.');
//             break;
//           case auth_error.passcodeNotSet:
//             _showSnackBar(context, 'Please set up device security to use fingerprint login.');
//             break;
//           case auth_error.notAvailable:
//             _showSnackBar(context, 'Fingerprint authentication is not available on this device.');
//             break;
//           case auth_error.notEnrolled:
//             _showSnackBar(context, 'No fingerprints enrolled. Please add fingerprints in device settings.');
//             break;
//           default:
//             _showSnackBar(context, 'Fingerprint authentication failed: ${e.message}');
//         }
//       } else {
//         _showSnackBar(context, 'Fingerprint authentication failed. Please try again.');
//       }
//     }
//   }

//   bool _isStrongPassword(String password) {
//     // At least 8 characters with mix of upper, lower, number/special char
//     if (password.length < 8) return false;
//     if (!password.contains(RegExp(r'[A-Z]'))) return false;
//     if (!password.contains(RegExp(r'[a-z]'))) return false;
//     if (!password.contains(RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'))) return false;
//     return true;
//   }

//   void _navigateToHomePage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const HomePage(),
//       ),
//     );
//   }

//   void _showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         backgroundColor: const Color(0xFF2D1B69),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         elevation: 4,
//       ),
//     );
//   }
// }