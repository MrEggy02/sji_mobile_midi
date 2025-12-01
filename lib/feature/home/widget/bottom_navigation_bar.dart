import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          decoration: BoxDecoration(
            color: ThemeService.cardColor,
            border: Border(
              top: BorderSide(
                color: ThemeService.cardColor,
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem("assets/icons/home.png", "Home", 0, isDarkMode),
                  _buildNavItem("assets/icons/portfolio.png", "Portfolio", 1, isDarkMode),
                  _buildNavItem("assets/icons/trade.png", "", 2, isDarkMode),
                  _buildNavItem("assets/icons/market.png", "Market", 3, isDarkMode),
                  _buildNavItem("assets/icons/asset.png", "Assets", 4, isDarkMode),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

 Widget _buildNavItem(String imagePath, String label, int index, bool isDarkMode) {
  bool isSelected = currentIndex == index;

  return Expanded(
    child: GestureDetector(
      onTap: () => onIndexChanged(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            if (index == 2)
              Transform.translate(
                offset: const Offset(0, -18),
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryGreen, AppColors.primaryDarkGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      imagePath,
                      color: Colors.white,
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
   
            else
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      imagePath,
                      color: isSelected
                          ? AppColors.primaryGreen
                          : ThemeService.textSecondaryColor,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.primaryGreen
                          : ThemeService.textSecondaryColor,
                      fontSize: 10,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    ),
  );
}

}