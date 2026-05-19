import 'package:flutter/material.dart';

class DashboardTheme {
  DashboardTheme._();

  static const Color _lightBg = Color(0xFFF8F9FC);
  static const Color _darkBg = Color(0xFF0F1117);

  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _darkSurface = Color(0xFF1A1D27);

  static const Color _lightTextPrimary = Color(0xFF1A1D27);
  static const Color _darkTextPrimary = Color(0xFFF8F9FC);

  static const Color _lightTextSecondary = Color(0xFF6B7280);
  static const Color _darkTextSecondary = Color(0xFF9CA3AF);

  static const Color _lightTextDisabled = Color(0xFFD1D5DB);
  static const Color _darkTextDisabled = Color(0xFF4B5563);

  static const Color _lightCardBorder = Color(0xFFE5E7EB);
  static const Color _darkCardBorder = Color(0xFF2D3142);

  static const Color _primaryLight = Color(0xFF6C63FF);
  static const Color _primaryDark = Color(0xFF8B83FF);

  static const Color _successLight = Color(0xFF2E7D32);
  static const Color _successDark = Color(0xFF66BB6A);

  static const Color _warningLight = Color(0xFFF59E0B);
  static const Color _warningDark = Color(0xFFFFB74D);

  static const Color _dangerLight = Color(0xFFEF4444);
  static const Color _dangerDark = Color(0xFFF87171);

  static const LinearGradient _heroGradientLight = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF5A52D5), Color(0xFF4840B8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient _heroGradientDark = LinearGradient(
    colors: [Color(0xFF8B83FF), Color(0xFF7B73E5), Color(0xFF6B63D5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient _successGradientLight = LinearGradient(
    colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient _successGradientDark = LinearGradient(
    colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient _warmGradientLight = LinearGradient(
    colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient _warmGradientDark = LinearGradient(
    colors: [Color(0xFFFFB74D), Color(0xFFF59E0B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color background(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _darkBg : _lightBg;
  }

  static Color surface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _darkSurface : _lightSurface;
  }

  static Color textPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _darkTextPrimary : _lightTextPrimary;
  }

  static Color textSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _darkTextSecondary : _lightTextSecondary;
  }

  static Color textDisabled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _darkTextDisabled : _lightTextDisabled;
  }

  static Color cardBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _darkCardBorder : _lightCardBorder;
  }

  static Color primary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _primaryDark : _primaryLight;
  }

  static Color success(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _successDark : _successLight;
  }

  static Color warning(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _warningDark : _warningLight;
  }

  static Color danger(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _dangerDark : _dangerLight;
  }

  static LinearGradient heroGradient(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _heroGradientDark : _heroGradientLight;
  }

  static LinearGradient successGradient(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _successGradientDark : _successGradientLight;
  }

  static LinearGradient warmGradient(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? _warmGradientDark : _warmGradientLight;
  }

  static double get cardRadius => 24.0;

  static EdgeInsets get cardPadding => const EdgeInsets.all(20);

  static double get sectionSpacing => 20.0;

  static double get itemSpacing => 12.0;
}
