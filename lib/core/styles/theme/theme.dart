import 'package:flutter/material.dart';


class ThemeManager extends InheritedWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;
  final Widget child;

  const ThemeManager({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.child,
  }) : super(child: child);

  static ThemeManager of(BuildContext context) {
    final ThemeManager? result = 
        context.dependOnInheritedWidgetOfExactType<ThemeManager>();
    assert(result != null, 'No ThemeManager found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeManager oldWidget) {
    return isDarkMode != oldWidget.isDarkMode;
  }
}

class ThemeManagerWrapper extends StatefulWidget {
  final Widget child;

  const ThemeManagerWrapper({super.key, required this.child});

  @override
  State<ThemeManagerWrapper> createState() => _ThemeManagerWrapperState();
}

class _ThemeManagerWrapperState extends State<ThemeManagerWrapper> {
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      isDarkMode: _isDarkMode,
      toggleTheme: _toggleTheme,
      child: widget.child,
    );
  }
}