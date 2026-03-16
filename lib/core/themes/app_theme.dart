import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/constants/colors/dark_theme_colors.dart';
import 'package:flutter_riverpod_template/core/constants/colors/light_theme_colors.dart';

class AppTheme {
  final ThemeData data;
  final bool isLight;

  AppTheme(this.data, {this.isLight = true});

  /// ===== Core colors =====
  Color get primary => data.colorScheme.primary;
  Color get primaryLight => data.colorScheme.primaryContainer;
  Color get secondary => data.colorScheme.secondary;
  Color get secondaryLight => data.colorScheme.secondaryContainer;
  Color get surface => data.colorScheme.surface;
  Color get background => data.scaffoldBackgroundColor;
  Color get scaffoldBackgroundColor => background;
  Color get accent =>
      data.floatingActionButtonTheme.backgroundColor ??
      data.colorScheme.secondary;

  /// ===== Text colors =====
  Color get textPrimary => data.textTheme.bodyLarge?.color ?? Colors.black;
  Color get textSecondary => data.textTheme.bodyMedium?.color ?? Colors.grey;

  /// ===== Typography =====
  TextStyle get headlineLarge => data.textTheme.headlineLarge!;
  TextStyle get headlineMedium => data.textTheme.headlineMedium!;
  TextStyle get headlineSmall => data.textTheme.headlineSmall!;
  TextStyle get titleLarge => data.textTheme.titleLarge!;
  TextStyle get titleMedium => data.textTheme.titleMedium!;
  TextStyle get titleSmall => data.textTheme.titleSmall!;
  TextStyle get bodyLarge => data.textTheme.bodyLarge!;
  TextStyle get bodyMedium => data.textTheme.bodyMedium!;
  TextStyle get bodySmall => data.textTheme.bodySmall!;
  TextStyle get labelLarge => data.textTheme.labelLarge!;
  TextStyle get labelMedium => data.textTheme.labelMedium!;

  /// ===== CUSTOM COLORS =====
  Color get discountBadge =>
      isLight ? LightThemeColors.discountBadge : DarkThemeColors.discountBadge;
  Color get ratingStar =>
      isLight ? LightThemeColors.ratingStar : DarkThemeColors.ratingStar;
  Color get highlight =>
      isLight ? LightThemeColors.highlight : DarkThemeColors.highlight;
  Color get onboardingHeadingText => isLight
      ? LightThemeColors.onboardingHeadingText
      : DarkThemeColors.onboardingHeadingText;
  Color get onboardingBodyText => isLight
      ? LightThemeColors.onboardingBodyText
      : DarkThemeColors.onboardingBodyText;
  Color get onboardingCardBorder => isLight
      ? LightThemeColors.onboardingCardBorder
      : DarkThemeColors.onboardingCardBorder;

  List<Color> get onboardingGradientText => isLight
      ? LightThemeColors.onboardingTextGradient
      : DarkThemeColors.onboardingTextGradient;
  List<Color> get onboardingCardGradient => isLight
      ? LightThemeColors.onboardingCardGradient
      : DarkThemeColors.onboardingCardGradient;
  List<Color> get buttonGradient => isLight
      ? LightThemeColors.buttonGradient
      : DarkThemeColors.buttonGradient;

  Color get error => isLight ? LightThemeColors.error : DarkThemeColors.error;
  Color get hintText =>
      isLight ? LightThemeColors.hintText : DarkThemeColors.hintText;
  Color get textfieldIcon =>
      isLight ? LightThemeColors.textfieldIcon : DarkThemeColors.textfieldIcon;
  Color get textfieldFill =>
      isLight ? LightThemeColors.textfieldFill : DarkThemeColors.textfieldFill;
  Color get textfieldBorder => isLight
      ? LightThemeColors.textfieldBorder
      : DarkThemeColors.textfieldBorder;
  Color get textfieldEnabledBorder => isLight
      ? LightThemeColors.textfieldEnabledBorder
      : DarkThemeColors.textfieldEnabledBorder;
  Color get checkboxBorder => isLight
      ? LightThemeColors.checkboxBorder
      : DarkThemeColors.checkboxBorder;
  Color get inactiveIndicator => isLight
      ? LightThemeColors.inactiveIndicator
      : DarkThemeColors.inactiveIndicator;
  List<Color> get activeIndicator => isLight
      ? LightThemeColors.activeIndicator
      : DarkThemeColors.activeIndicator;

  Color get carouselCardBackground => isLight
      ? LightThemeColors.carouselCardBackground
      : DarkThemeColors.carouselCardBackground;

  Color get textfieldLabel => isLight
      ? LightThemeColors.textfieldLabel
      : DarkThemeColors.textfieldLabel;
  Color get defaultText =>
      isLight ? LightThemeColors.defaultText : DarkThemeColors.defaultText;
  Color get prayerAvatarInactiveBackground => isLight
      ? LightThemeColors.prayerAvatarInactiveBackground
      : DarkThemeColors.prayerAvatarInactiveBackground;
  Color get prayerAvatarActiveBackground => isLight
      ? LightThemeColors.prayerAvatarActiveBackground
      : DarkThemeColors.prayerAvatarActiveBackground;
  Color get prayerTileBackground => isLight
      ? LightThemeColors.prayerTileBackground
      : DarkThemeColors.prayerTileBackground;
  Color get tasbeehCardBackground => isLight
      ? LightThemeColors.tasbeehCardBackground
      : DarkThemeColors.tasbeehCardBackground;
  Color get tasbeehCardInactiveText => isLight
      ? LightThemeColors.tasbeehCardInactiveText
      : DarkThemeColors.tasbeehCardInactiveText;
  Color get tasbeehCardInactiveBackground => isLight
      ? LightThemeColors.tasbeehCardInactiveBackground
      : DarkThemeColors.tasbeehCardInactiveBackground;
  Color get tasbeehCounterBackground => isLight
      ? LightThemeColors.tasbeehCounterBackground
      : DarkThemeColors.tasbeehCounterBackground;
  Color get tasbeehCounterUnfilled => isLight
      ? LightThemeColors.tasbeehCounterUnfilled
      : DarkThemeColors.tasbeehCounterUnfilled;
  Color get themePrefTipText => isLight
      ? LightThemeColors.themePrefTipText
      : DarkThemeColors.themePrefTipText;
  Color get themePrefTipCardBg => isLight
      ? LightThemeColors.themePrefTipCardBg
      : DarkThemeColors.themePrefTipCardBg;
  Color get settingsTipText => isLight
      ? LightThemeColors.settingsTipText
      : DarkThemeColors.settingsTipText;
  Color get settingsTipCardBg => isLight
      ? LightThemeColors.settingsTipCardBg
      : DarkThemeColors.settingsTipCardBg;
  Color get settingsTipBorder => isLight
      ? LightThemeColors.settingsTipBorder
      : DarkThemeColors.settingsTipBorder;

  Color get settingsCardDefaultBg => isLight
      ? LightThemeColors.settingsCardDefaultBg
      : DarkThemeColors.settingsCardDefaultBg;
  Color get settingsCardDefaultBorder => isLight
      ? LightThemeColors.settingsCardDefaultBorder
      : DarkThemeColors.settingsCardDefaultBorder;

  Color get defaultScreenUnselctedIconCardbg => isLight
      ? LightThemeColors.defaultScreenUnselctedIconCardbg
      : DarkThemeColors.defaultScreenUnselctedIconCardbg;
  Color get defaultScreenUnselctedIconbg => isLight
      ? LightThemeColors.defaultScreenUnselctedIconbg
      : DarkThemeColors.defaultScreenUnselctedIconbg;
  Color get defaultScreenSelctedIconCardbg => isLight
      ? LightThemeColors.defaultScreenSelctedIconCardbg
      : DarkThemeColors.defaultScreenSelctedIconCardbg;
  Color get defaultScreenSelctedIconbg => isLight
      ? LightThemeColors.defaultScreenSelctedIconbg
      : DarkThemeColors.defaultScreenSelctedIconbg;
  Color get defaultScreenSelctedCardTitle => isLight
      ? LightThemeColors.defaultScreenSelctedCardTitle
      : DarkThemeColors.defaultScreenSelctedCardTitle;
  Color get defaultScreenSelctedCardSubtile => isLight
      ? LightThemeColors.defaultScreenSelctedCardSubtile
      : DarkThemeColors.defaultScreenSelctedCardSubtile;
  Color get defaultScreenUnselctedCardTitle => isLight
      ? LightThemeColors.defaultScreenUnselctedCardTitle
      : DarkThemeColors.defaultScreenUnselctedCardTitle;
  Color get defaultScreenUnselctedCardSubtile => isLight
      ? LightThemeColors.defaultScreenUnselctedCardSubtile
      : DarkThemeColors.defaultScreenUnselctedCardSubtile;

  List<Color> get settingsSelectedTileGradient => isLight
      ? LightThemeColors.settingsSelectedTileGradient
      : DarkThemeColors.settingsSelectedTileGradient;
  List<Color> get settingsUnselectedTileGradient => isLight
      ? LightThemeColors.settingsUnselectedTileGradient
      : DarkThemeColors.settingsUnselectedTileGradient;
  Color get settingsUnselectedTileBorder => isLight
      ? LightThemeColors.settingsUnselectedTileBorder
      : DarkThemeColors.settingsUnselectedTileBorder;

  List<Color> get lightThemeIconCardBgGradient => isLight
      ? LightThemeColors.lightThemeIconCardBgGradient
      : DarkThemeColors.lightThemeIconCardBgGradient;
  List<Color> get darkThemeIconCardBgGradient => isLight
      ? LightThemeColors.darkThemeIconCardBgGradient
      : DarkThemeColors.darkThemeIconCardBgGradient;
  List<Color> get systemThemeIconCardBgGradient => isLight
      ? LightThemeColors.systemThemeIconCardBgGradient
      : DarkThemeColors.systemThemeIconCardBgGradient;
  List<Color> get selectedThemeCardBgGradient => isLight
      ? LightThemeColors.selectedThemeCardBgGradient
      : DarkThemeColors.selectedThemeCardBgGradient;
  Color get unSelectedThemeCardBg => isLight
      ? LightThemeColors.unSelectedThemeCardBg
      : DarkThemeColors.unSelectedThemeCardBg;
  Color get settingsDefaultIconCardBg => isLight
      ? LightThemeColors.settingsDefaultIconCardBg
      : DarkThemeColors.settingsDefaultIconCardBg;

  // Qibla
  Color get qiblaAccent =>
      isLight ? LightThemeColors.qiblaAccent : DarkThemeColors.qiblaAccent;
  Color get compassDialBg =>
      isLight ? LightThemeColors.compassDialBg : DarkThemeColors.compassDialBg;
  Color get compassDialTicksMinor => isLight
      ? LightThemeColors.compassDialTicksMinor
      : DarkThemeColors.compassDialTicksMinor;
  Color get compassCardinalText => isLight
      ? LightThemeColors.compassCardinalText
      : DarkThemeColors.compassCardinalText;
  Color get compassCentralHeaderText => isLight
      ? LightThemeColors.compassCentralHeaderText
      : DarkThemeColors.compassCentralHeaderText;
  Color get compassIndicatorColor => qiblaAccent.withValues(alpha: 0.6);

  // Prayer Tile & Section Header
  Color get prayerTileActiveBg => isLight
      ? LightThemeColors.prayerTileActiveBg
      : DarkThemeColors.prayerTileActiveBg;
  Color get prayerTileActiveBg2 => isLight
      ? LightThemeColors.prayerTileActiveBg2
      : DarkThemeColors.prayerTileActiveBg2;
  Color get prayerTileActiveBorder => isLight
      ? LightThemeColors.prayerTileActiveBorder
      : DarkThemeColors.prayerTileActiveBorder;
  Color get viewAllBg =>
      isLight ? LightThemeColors.viewAllBg : DarkThemeColors.viewAllBg;
  Color get viewAllText =>
      isLight ? LightThemeColors.viewAllText : DarkThemeColors.viewAllText;

  // Tags
  Color get sectionHeaderTagCyanBg => isLight
      ? LightThemeColors.sectionHeaderTagCyanBg
      : DarkThemeColors.sectionHeaderTagCyanBg;
  Color get sectionHeaderTagCyanText => isLight
      ? LightThemeColors.sectionHeaderTagCyanText
      : DarkThemeColors.sectionHeaderTagCyanText;
  Color get sectionHeaderTagGreyBg => isLight
      ? LightThemeColors.sectionHeaderTagGreyBg
      : DarkThemeColors.sectionHeaderTagGreyBg;
  Color get sectionHeaderTagGreyText => isLight
      ? LightThemeColors.sectionHeaderTagGreyText
      : DarkThemeColors.sectionHeaderTagGreyText;

  List<Color> get qiblaGradient =>
      isLight ? LightThemeColors.qiblaGradient : DarkThemeColors.qiblaGradient;
  List<Color> get currentPrayerCardGradient => isLight
      ? LightThemeColors.currentPrayerCardGradient
      : DarkThemeColors.currentPrayerCardGradient;

  Color get appNameColor =>
      isLight ? LightThemeColors.appNameColor : DarkThemeColors.appNameColor;
  Color get madhabFounderCardBg => isLight
      ? LightThemeColors.madhabFounderCardBg
      : DarkThemeColors.madhabFounderCardBg;
  Color get madhabFounderCardBorder => isLight
      ? LightThemeColors.madhabFounderCardBorder
      : DarkThemeColors.madhabFounderCardBorder;
  Color get madhabRegionListBg => isLight
      ? LightThemeColors.madhabRegionListBg
      : DarkThemeColors.madhabRegionListBg;
  Color get madhabRegionListBorder => isLight
      ? LightThemeColors.madhabRegionListBorder
      : DarkThemeColors.madhabRegionListBorder;

  // Calendar
  Color get calendarExpandToggleBg => isLight
      ? LightThemeColors.calendarExpandToggleBg
      : DarkThemeColors.calendarExpandToggleBg;
  Color get calendarExpandToggleIcon => isLight
      ? LightThemeColors.calendarExpandToggleIcon
      : DarkThemeColors.calendarExpandToggleIcon;
  Color get calendarNavButtonBg => isLight
      ? LightThemeColors.calendarNavButtonBg
      : DarkThemeColors.calendarNavButtonBg;
  Color get calendarSelectedWeekdayText => isLight
      ? LightThemeColors.calendarSelectedWeekdayText
      : DarkThemeColors.calendarSelectedWeekdayText;
  Color get calendarDayShadow => isLight
      ? LightThemeColors.calendarDayShadow
      : DarkThemeColors.calendarDayShadow;

  // Selection
  Color get selectionCheckColor => isLight
      ? LightThemeColors.selectionCheckColor
      : DarkThemeColors.selectionCheckColor;
  // prayerTileActiveAvatarBg
  Color get prayerTileActiveAvatarBg => isLight
      ? LightThemeColors.prayerTileActiveAvatarBg
      : DarkThemeColors.prayerTileActiveAvatarBg;
}
