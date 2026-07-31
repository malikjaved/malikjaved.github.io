import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens — premium SaaS dark theme (Stripe / Linear / Vercel inspired).
class AppColors {
  // ── Primary accent (CTAs & key highlights only) ──
  static const primary = Color(0xFF4F46E5);
  static const secondary = Color(0xFF6366F1);
  static const accentHover = Color(0xFF818CF8);

  /// rgba(79, 70, 229, 0.2)
  static const accentSubtle = Color(0x334F46E5);

  /// rgba(79, 70, 229, 0.08) — hover / soft highlights
  static const accentFaint = Color(0x144F46E5);

  // ── Backgrounds ──
  static const background = Color(0xFF0B0F19);
  static const backgroundElevated = Color(0xFF0D1323);
  static const surface = Color(0xFF111827);
  static const surfaceLight = Color(0xFF161B2E);

  // ── Text ──
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFA1A1AA);
  static const textMuted = Color(0xFF6B7280);

  // ── Neutral borders & dividers (no purple) ──
  static const border = Color(0xFF1E293B);
  static const borderSubtle = Color(0xFF252A3A);

  static const success = Color(0xFF10B981);

  // Legacy aliases
  static const accent = primary;
  static const accentLight = secondary;
}

class AppGradients {
  static const background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.background, AppColors.backgroundElevated],
  );

  static const primaryButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, AppColors.secondary],
  );

  static const primaryButtonHover = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.secondary, AppColors.accentHover],
  );

  static RadialGradient heroGlow = RadialGradient(
    center: Alignment.topRight,
    radius: 1.2,
    colors: [
      AppColors.primary.withValues(alpha: 0.12),
      AppColors.primary.withValues(alpha: 0.04),
      Colors.transparent,
    ],
    stops: const [0.0, 0.45, 1.0],
  );
}

class AppShadows {
  static List<BoxShadow> primaryButton({bool hovered = false}) => [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: hovered ? 0.42 : 0.30),
          blurRadius: hovered ? 36 : 30,
          offset: Offset(0, hovered ? 10 : 8),
        ),
      ];

  static List<BoxShadow> profileImage = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.15),
      blurRadius: 40,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.35),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];

  static List<BoxShadow> cardHover = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.28),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];
}

class AppTheme {
  static ThemeData get darkTheme {
    final base = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
      ),
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textSecondary,
        displayColor: AppColors.textPrimary,
      ),
    );
  }

  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.1,
        letterSpacing: -0.5,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  /// Section labels — neutral, not accent
  static TextStyle get label => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
        letterSpacing: 0.8,
      );

  /// Section numbers — muted gray
  static TextStyle get sectionNumber => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textMuted,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  /// Stat / metric numbers — bright white, high impact
  static TextStyle statValue({double size = 36}) => GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.0,
        letterSpacing: -0.5,
      );

  static TextStyle get statLabel => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
      );
}
