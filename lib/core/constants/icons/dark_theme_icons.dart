import 'package:flutter_riverpod_template/core/constants/icons/app_icons.dart';

class DarkThemeIcons implements AppIcons {
  final String _iconPath = 'assets/icons/dark/';

  @override
  String get refresh => '${_iconPath}refresh.svg';

  @override
  String get visible => '${_iconPath}visible.svg';

  @override
  String get invisible => '${_iconPath}invisible.svg';
}
