import 'package:flutter/material.dart';
import 'package:test_v_tech/utils/theme/app_default_theme.dart';
import 'package:test_v_tech/utils/theme/base_theme_data.dart';

import 'base_app_theme.dart';

class AppThemeUtil {
  static final AppThemeUtil instance = AppThemeUtil._();

  AppThemeUtil._();

  final BaseAppTheme themeNotifier = AppThemeDefault();

  final ValueNotifier<ThemeType> themeType = ValueNotifier(ThemeType.light);

  void dispose() {
    themeType.dispose();
  }

  ThemeData getThemeData() {
    return themeNotifier.getThemeData(themeType.value);
  }

  BaseThemeData getAppTheme() {
    return themeNotifier.getBaseTheme(themeType.value);
  }

  onChangeLightDarkMode() {
    if (themeType.value == ThemeType.light) {
      themeType.value = ThemeType.dark;
    } else {
      themeType.value = ThemeType.light;
    }
  }
}

class AppThemeConstant {
  static const defaultTheme = 'default';

  static const cryptoTheme = 'crypto';

  static const otherTheme = 'other';
}
