// home_banner.dart
import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class HomeBanner extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClose;

  const HomeBanner({super.key, required this.imagePath, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          color: ThemeService.cardColor,
          padding: const EdgeInsets.symmetric(),
          child: Stack(
            children: [
              // Banner Container
              Container(
                width: double.infinity,
                height: 70, // Adjust height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              // Close button
              Positioned(
                top: -2,
                right: -4,
                child: GestureDetector(
                  onTap: onClose,
                  child: Container(
                    width: 20,
                    height: 20, 
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        4,
                      ), // square with soft edges
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
