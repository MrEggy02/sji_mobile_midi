// import 'package:flutter/material.dart';
// import 'package:sji_mobile/core/styles/color/styles_color.dart';
// import 'package:sji_mobile/core/styles/theme/theme_service.dart';

// class NewsSection extends StatelessWidget {
//   const NewsSection({super.key});

//   final List<Map<String, dynamic>> _newsItems = const [
//     {
//       'symbol': 'FED',
//       'title': 'Fed Holds Rates Steady, Markets React',
//       'change': '+2.3%',
//       'isPositive': true,
//     },
//     {
//       'symbol': 'TECH',
//       'title': 'AI Stocks Surge on New Breakthrough',
//       'change': '+4.1%',
//       'isPositive': true,
//     },
//     {
//       'symbol': 'OIL',
//       'title': 'Oil Prices Fall as Production Rises',
//       'change': '-1.8%',
//       'isPositive': false,
//     },
//     {
//       'symbol': 'BANK',
//       'title': 'Bank Earnings Beat Expectations',
//       'change': '+3.2%',
//       'isPositive': true,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: ThemeService.isDarkMode,
//       builder: (context, isDarkMode, child) {
//         return Container(
//           margin: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Section Title
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Market News",
//                     style: TextStyle(
//                       color: ThemeService.textPrimaryColor.withOpacity(0.8),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
              
//               // News Container
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: ThemeService.cardColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     // Header Row
//                     _buildHeaderRow(isDarkMode),
//                     const SizedBox(height: 16),
                    
//                     // News Items
//                     ..._newsItems.map((news) => _buildNewsItem(news, isDarkMode)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeaderRow(bool isDarkMode) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       child: Row(
//         children: [   
//           const SizedBox(width: 12),
          
//           Expanded(
//             child: Text(
//               "News",
//               style: TextStyle(
//                 color: ThemeService.textSecondaryColor,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
          
//           Container(
//             width: 60,
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             // child: Text(
//             //   "Impact",
//             //   style: TextStyle(
//             //     color: ThemeService.textSecondaryColor,
//             //     fontSize: 12,
//             //     fontWeight: FontWeight.w600,
//             //   ),
//             // ),
//           ),
          
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 "Change",
//                 style: TextStyle(
//                   color: ThemeService.textSecondaryColor,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNewsItem(Map<String, dynamic> news, bool isDarkMode) {
//     Color changeColor = news['isPositive'] ? AppColors.positive : AppColors.negative;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Row(
//         children: [
//           // Symbol
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
//                   (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 news['symbol'],
//                 style: TextStyle(
//                   color: ThemeService.textPrimaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
          
//           // News Title
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   news['title'],
//                   style: TextStyle(
//                     color: ThemeService.textPrimaryColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   "Market News",
//                   style: TextStyle(
//                     color: ThemeService.textSecondaryColor,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
          
//           // Change
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 news['change'],
//                 style: TextStyle(
//                   color: changeColor,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                 ),
//               ),
//               Text(
//                 "Impact",
//                 style: TextStyle(
//                   color: ThemeService.textSecondaryColor, 
//                   fontSize: 12
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }