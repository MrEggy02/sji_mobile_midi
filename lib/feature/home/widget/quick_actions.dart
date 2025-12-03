import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class QuickActions extends StatefulWidget {
  const QuickActions({super.key});

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<List<Map<String, dynamic>>> _actionPages = [
    // First page
    [
      {"label": "Deposit", "image": "assets/icons/deposit.png"},
      {"label": "Withdraw", "image": "assets/icons/withdraw.png"},
      {"label": "Buy", "image": "assets/icons/buy.png"},
      {"label": "Sell", "image": "assets/icons/sell.png"},
    ],
    // Second page (for future buttons)
    [
      {"label": "Transfer", "image": "assets/icons/transfer.png"},
      {"label": "History", "image": "assets/icons/history.png"},
      {"label": "Scan", "image": "assets/icons/qr-scan.png"},
      {"label": "Pay", "image": "assets/icons/payment.png"},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: ThemeService.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70, // Fixed height for the page view
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _actionPages.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, pageIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _actionPages[pageIndex].map((action) {
                        return _buildActionButton(
                          action["label"] as String,
                          action["image"] as String,
                          isDarkMode,
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              // Page indicator dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_actionPages.length, (index) {
                  return _buildDot(
                    isActive: index == _currentPage,
                    isDarkMode: isDarkMode,
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton(String text, String imagePath, bool isDarkMode) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                Colors.transparent, // Removed gradient → transparent background
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,

              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),

        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDot({required bool isActive, required bool isDarkMode}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: isActive ? 40 : 14,
      height: 6,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryGreen
            : (isDarkMode ? Colors.grey.shade600 : Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
