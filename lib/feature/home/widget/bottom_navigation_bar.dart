import 'package:flutter/material.dart';

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
              top: BorderSide(color: ThemeService.cardColor, width: 1),
            ),
          ),
          child: SafeArea(
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Home button
                  _buildNavItem(
                    activeImagePath: "assets/icons/sji1.png",
                    inactiveImagePath: "assets/icons/home.png",
                    label: "Home",
                    index: 0,
                    isDarkMode: isDarkMode,
                    isSpecial: false,
                  ),

                  _buildNavItem(
                    activeImagePath: "assets/icons/portfolio1.png",
                    inactiveImagePath: "assets/icons/portfolio.png",
                    label: "Portfolio",
                    index: 1,
                    isDarkMode: isDarkMode,
                    isSpecial: false,
                  ),

                  _buildNavItem(
                    activeImagePath: "assets/icons/image.png",
                    inactiveImagePath: "assets/icons/image.png",
                    label: "",
                    index: 2,
                    isDarkMode: isDarkMode,
                    isSpecial: true,
                  ),

                  // Watchlist button
                  _buildNavItem(
                    activeImagePath: "assets/icons/watchlist1.png",
                    inactiveImagePath: "assets/icons/watchlist.png",
                    label: "Watchlist",
                    index: 3,
                    isDarkMode: isDarkMode,
                    isSpecial: false,
                  ),

                  // Market button
                  _buildNavItem(
                    activeImagePath: "assets/icons/market1.png",
                    inactiveImagePath: "assets/icons/market.png",
                    label: "Market",
                    index: 4,
                    isDarkMode: isDarkMode,
                    isSpecial: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required String activeImagePath,
    required String inactiveImagePath,
    required String label,
    required int index,
    required bool isDarkMode,
    required bool isSpecial,
  }) {
    bool isSelected = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onIndexChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: isSelected && !isSpecial
                    ? AppColors.primaryGreen
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSpecial)
                // Special Trade button design - always green
                Transform.translate(
                  offset: const Offset(0, -18),
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primaryGreen,
                          AppColors.primaryDarkGreen,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ThemeService.cardColor,
                          width: 3,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          inactiveImagePath, 
                          color: Colors.white,
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
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
                        isSelected ? activeImagePath : inactiveImagePath,
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
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
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
