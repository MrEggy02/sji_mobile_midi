import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  final int currentIndex;
  final VoidCallback? onBackPressed;
  final bool showBackButton;

  const SimpleAppBar({
    super.key,
    required this.currentIndex,
    this.onBackPressed,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00E08F), Color(0xFF007A5A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showBackButton
              ? IconButton(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                )
              : const SizedBox(width: 48),
          Text(
            _getTitle(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 20,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (currentIndex) {
      case 1:
        return "Portfolio";
      case 2:
        return "Trade";
      case 3:
        return "Watchlist";
      case 4:
        return "Market";
      default:
        return "Home";
    }
  }
}