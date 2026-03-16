import 'package:flutter/material.dart';

class LightThemeColors {
  // Primary colors
  static const primary = Color(0xFF00B8DB); // Deep Blue
  static const primaryLight = Color(0xFF1976D2);
  static const primaryGradientStart = Color(0xFF1976D2);
  static const primaryGradientEnd = Color(0xFF42A5F5);
  static const accent = Color(0xFFFFC107); // Amber

  // Backgrounds
  static const background = Colors.white;
  static const surface = Color(0xFFF9FAFC); // Slightly off-white for cards

  // Text
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF616161);
  static const defaultText = Color(0xFF101828);
  // Status colors
  static const success = Color(0xFF2E7D32);
  static const warning = Color(0xFFF57C00);
  static const error = Color(0xFFE7000B);
  static const info = Color(0xFF0288D1);

  // Disabled
  static const disabled = Color(0xFFBDBDBD);

  // ===== CUSTOM COLORS =====
  static const discountBadge = Color(0xFFFF5252);
  static const ratingStar = Color(0xFFFFC107);
  static const highlight = Color(0xFF1565C0); // Slightly brighter for CTA/FAB

  static const onboardingHeadingText = Color(0xFF0F172A);
  static const onboardingBodyText = Color(0xFFB0B0B0);
  static const onboardingCardBorder = Color(0x80CBFBF1);
  static const textfieldIcon = Color(0xFF6A7282);
  static const hintText = Color(0xFF99A1AF);
  static const textfieldFill = Color(0xFFF9FAFB);
  static const textfieldBorder = Color(0xFFE5E7EB);
  static const textfieldEnabledBorder = primary;
  static const textfieldLabel = Color(0xFF364153);

  static const checkboxBorder = Color(0xFFD1D5DB);

  static const inactiveIndicator = Color(0XFFCAD5E2);
  static const carouselCardBackground = Color(0XFFF8F8F8);
  static const prayerAvatarInactiveBackground = Color(0XFFF3F4F6);
  static const tasbeehCardBackground = Color(0XFFF3F4F6);
  static const tasbeehCardInactiveText = Color(0XFF4A5565);
  static const tasbeehCardInactiveBackground = Color(0XFFF3F4F6);
  static const prayerAvatarActiveBackground = Color(0XFFCEFAFE);

  static const tasbeehCounterUnfilled = Color(0xFFE5E7EB);
  static const tasbeehCounterBackground = Colors.white;
  static const prayerTileBackground = Colors.white;

  static const themePrefTipText = Color(0xFF64748B);
  static const themePrefTipCardBg = Color(0xFFEFF6FF);

  static const List<Color> activeIndicator = [Color(0xFF00BC7D), primary];

  static const settingsTipText = Color(0xFF0891B2);
  static const settingsTipCardBg = Color(0xCCECFEFF);
  static const settingsTipBorder = Color(0x80A2F4FD);

  static const defaultScreenUnselctedIconCardbg = Color(0xFFF3F4F6);
  static const defaultScreenUnselctedIconbg = Color(0xFF4A5565);
  static const defaultScreenSelctedIconCardbg = Color(0x3300B8DB);
  static const defaultScreenSelctedIconbg = Color(0xFF0092B8);
  static const defaultScreenSelctedCardTitle = Color(0xFF0891B2);
  static const defaultScreenSelctedCardSubtile = Color(0xFF64748B);
  static const defaultScreenUnselctedCardTitle = Color(0xFF130F26);
  static const defaultScreenUnselctedCardSubtile = Color(0xFF64748B);

  static const settingsCardDefaultBg = Color(0xFFFAFAFA);
  static const settingsCardDefaultBorder = Color(0xFFE5E7EB);

  static const settingsDefaultIconCardBg = Color(0xFFFFFFFF);
  static const List<Color> onboardingCardGradient = [
    Color(0xFFF0FDFA),
    Color(0xFFECFEFF),
  ];

  static const List<Color> onboardingTextGradient = [
    Color(0xFF00786F),
    Color(0xFF007595),
  ];
  static const List<Color> buttonGradient = [
    Color(0xFF009689),
    Color(0xFF0092B8),
    Color(0xFF155DFC),
  ];

  static const List<Color> settingsSelectedTileGradient = [
    Color(0xFFECFEFF),
    Color(0xFFEFF6FF),
  ];
  static const List<Color> settingsUnselectedTileGradient = [
    Color(0xFFFFFFFF),
    Color(0xFFF9FAFB),
  ];
  static const settingsUnselectedTileBorder = Color(0xFFE5E7EB);

  static const List<Color> lightThemeIconCardBgGradient = [
    Color(0xFFFDC700),
    Color(0xFFFF6900),
  ];
  static const List<Color> darkThemeIconCardBgGradient = [
    Color(0xFF615FFF),
    Color(0xFF9810FA),
  ];
  static const List<Color> systemThemeIconCardBgGradient = [
    Color(0xFF00B8DB),
    Color(0xFF155DFC),
  ];
  static const List<Color> selectedThemeCardBgGradient = [
    Color(0xFF00BBA7),
    Color(0xFF00B8DB),
    Color(0xFF2B7FFF),
  ];

  static const Color unSelectedThemeCardBg = Color(0XFFFAFAFA);

  // Qibla
  static const qiblaAccent = Color(0xFF00B8DB);
  static const compassDialBg = Colors.white;
  static const compassDialTicksMinor = Color(0xFF64748B);
  static const compassCardinalText = Colors.black38;
  static const compassCentralHeaderText = Color(0xFF0F172A);

  // Prayer Tile & Section Header
  static const prayerTileActiveBg = Color(0x0D00B8DB);
  static const prayerTileActiveBg2 = Color(0xFFECFEFF);
  static const prayerTileActiveBorder = Color(0xFF00B8DB);
  static const viewAllBg = Color(0x1A00B8DB);
  static const viewAllText = Color(0xFF00B8DB);

  // Tags
  static const sectionHeaderTagCyanBg = Color(0xFFE6F7F6);
  static const sectionHeaderTagCyanText = Color(0xFF00B8DB);
  static const sectionHeaderTagGreyBg = Color(0xFFF1F5F9);
  static const sectionHeaderTagGreyText = Color(0xFF64748B);

  static const List<Color> qiblaGradient = [
    Color(0xFF06B6D4),
    Color(0xFF0891B2),
    Color(0xFF67E8F9),
  ];
  static const List<Color> currentPrayerCardGradient = [
    Color(0xFF009689),
    Color(0xFF0092B8),
    Color(0xFF155DFC),
  ];

  static const appNameColor = Color(0xFF00B8DB);
  static const madhabFounderCardBg = Color(0x0D00B8DB); // 5% primary
  static const madhabFounderCardBorder = Color(0x1A00B8DB); // 10% primary
  static const madhabRegionListBg = Colors.white;
  static const madhabRegionListBorder = Color(0x08101828); // 3% defaultText

  // Calendar
  static const calendarExpandToggleBg = Color(0xFFE6F7FA);
  static const calendarExpandToggleIcon = Color(0xFF00B8DB);
  static const calendarNavButtonBg = Color(0xFFF3F4F6);
  static const calendarSelectedWeekdayText = Color(0xFF00B8DB);
  static const calendarDayShadow = Color(0xFF00B8DB); // Blue in light

  // Selection
  static const selectionCheckColor = Color(0xFF2E7D32); // Success green

  static const prayerTileActiveAvatarBg = Color(0xFFCEFAFE); // Light green
}
