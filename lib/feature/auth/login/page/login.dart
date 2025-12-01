// import 'package:flutter/material.dart';
// import 'package:sji_mobile/core/styles/styles_color.dart';
// import 'package:sji_mobile/feature/auth/register/page/register.dart';

// import '../confirm/page/confirm_login.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final _emailRegex = RegExp(
//     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//   );
//   bool _isEmailValid = false;

//   @override
//   void initState() {
//     super.initState();
//     _emailController.addListener(_validateEmail);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _validateEmail() {
//     final email = _emailController.text.trim();
//     setState(() {
//       _isEmailValid = _emailRegex.hasMatch(email);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               AppColors.primaryColor, // Dark Purple
//               AppColors.gradientStart, // Medium Purple
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Register button at top right
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 16.0, right: 16.0),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => RegisterPage()),
//                       );
//                     },
//                     child: const Text(
//                       "Register",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               // Logo Section
//               Padding(
//                 padding: const EdgeInsets.only(top: 40.0),
//                 child: Column(
//                   children: [
//                     // Logo Image with white border
//                     Container(
//                       width: 140,
//                       height: 140,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.white, width: 3),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Image.asset(
//                           'assets/images/logo.jpg',
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               color: Colors.grey[200],
//                               child: const Icon(
//                                 Icons.business,
//                                 size: 50,
//                                 color: Color(0xFF2D1B69),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Access your agreements\nfrom anywhere",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Main Content
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 20),
//                     Container(
//                       width: 320,
//                       child: TextField(
//                         controller: _emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         textInputAction: TextInputAction.done,
//                         decoration: InputDecoration(
//                           labelText:
//                               "Email or Username",
//                           labelStyle: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           // disappears when user types
//                           border: const UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 1.5,
//                             ),
//                           ),
//                           enabledBorder: const UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 1.5,
//                             ),
//                           ),
//                           focusedBorder: const UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 2,
//                             ),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             vertical: 8,
//                           ),
//                           isDense: true,
//                         ),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           letterSpacing: 2,
//                         ),
//                         onChanged: (value) {
//                           _validateEmail();
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     Container(
//                       width: 340,
//                       height: 56,
//                       decoration: BoxDecoration(
//                         color: _isEmailValid ? Colors.white : Colors.grey[400],
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           onTap: _isEmailValid
//     ? () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => EmailLogin(userEmail: _emailController.text.trim()),
//           ),
//         );
//       }
//     : null,
//                           borderRadius: BorderRadius.circular(16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.email,
//                                 color: _isEmailValid
//                                     ? const Color(0xFF2D1B69)
//                                     : Colors.grey[600],
//                                 size: 24,
//                               ),
//                               const SizedBox(width: 12),
//                               Text(
//                                 "Continue with email or username",
//                                 style: TextStyle(
//                                   color: _isEmailValid
//                                       ? Colors.black
//                                       : Colors.grey[600],
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 35),

//                     // OR SIGN IN WITH separator
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               height: 1,
//                               color: Colors.white.withOpacity(0.5),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0,
//                             ),
//                             child: Text(
//                               "OR SIGN IN WITH",
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.9),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               height: 1,
//                               color: Colors.white.withOpacity(0.5),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     Column(
//                       children: [
//                         _buildSocialLongButton(
//                           imagePath: 'assets/icons/google.png',
//                           text: "Continue with Google",
//                           color: Colors.white,
//                           textColor: Colors.black,
//                           onTap: () {
//                             // Google sign in logic
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                         _buildSocialLongButton(
//                           imagePath: 'assets/icons/apple.png',
//                           text: "Continue with Apple",
//                           color: Colors.white,
//                           textColor: Colors.black,
//                           onTap: () {
//                             // Apple sign in logic
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper widget for long social buttons
//   Widget _buildSocialLongButton({
//     required String imagePath,
//     required String text,
//     required Color color,
//     required Color textColor,
//     required VoidCallback onTap,
//   }) {
//     return Container(
//       width: 340,
//       height: 56,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(imagePath, height: 24, width: 24),
//               const SizedBox(width: 12),
//               Text(
//                 text,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
