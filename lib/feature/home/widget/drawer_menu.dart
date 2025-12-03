import 'package:flutter/material.dart';
import 'package:sji_mobile/core/routes/app_routes.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class DrawerMenu extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onLanguageTap;

  const DrawerMenu({
    super.key,
    required this.isDarkMode,
    required this.onLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDrawerItem(Icons.home_outlined, "Home", true, isDarkMode, () {}),
        _buildDrawerItem(Icons.lightbulb_outline, "Option", false, isDarkMode, () {}),
        _buildDrawerItem(Icons.account_balance, "Asset", false, isDarkMode, () {
          Navigator.pushNamed(context, AppRoutes.asset);
        }),
        _buildDrawerItem(Icons.map_rounded, "MiniMap", false, isDarkMode, () {}),
        _buildDrawerItem(Icons.translate, "Languages", false, isDarkMode, onLanguageTap),
        _buildDrawerItem(Icons.settings, "Settings", false, isDarkMode, () {}),
        _buildDrawerItem(Icons.help_outline, "Help & Support", false, isDarkMode, () {}),

        _buildThemeToggle(isDarkMode),

        const SizedBox(height: 6),
        Divider(color: isDarkMode ? AppColors.darkCardLight : AppColors.lightCardLight),
        _buildDrawerItem(Icons.logout, "Logout", false, isDarkMode, () {}),
      ],
    );
  }

  Widget _buildThemeToggle(bool isDarkMode) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (isDarkMode ? AppColors.darkCardLight : AppColors.lightCardLight).withOpacity(0.2),
      ),
      child: ListTile(
        leading: Icon(
          isDarkMode ? Icons.dark_mode : Icons.wb_sunny,
          color: isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
          size: 22,
        ),
        title: Text(
          isDarkMode ? "Dark Mode" : "Light Mode",
          style: TextStyle(
            color: isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: ValueListenableBuilder<bool>(
          valueListenable: ThemeService.isDarkMode,
          builder: (context, isDark, child) {
            return Switch(
              value: isDark,
              activeColor: AppColors.primaryGreen,
              onChanged: (bool value) {
                ThemeService.isDarkMode.value = value;
              },
            );
          },
        ),
        onTap: () {
          ThemeService.toggleTheme();
        },
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, bool isSelected, bool isDarkMode, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryDarkGreen.withOpacity(0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected 
              ? AppColors.primaryGreen 
              : (isDarkMode ? AppColors.darkIcon : AppColors.lightIcon),
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected 
                ? AppColors.primaryGreen 
                : (isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        dense: true,
      ),
    );
  }
}