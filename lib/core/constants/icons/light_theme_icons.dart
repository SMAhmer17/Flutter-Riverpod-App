import 'package:flutter_riverpod_template/core/constants/icons/app_icons.dart';

class LightThemeIcons implements AppIcons {
  final String _iconPath = 'assets/icons/light/';

  @override
  String get refresh => '${_iconPath}refresh.svg';

  @override
  String get visible => '${_iconPath}visible.svg';

  @override
  String get invisible => '${_iconPath}invisible.svg';
}
