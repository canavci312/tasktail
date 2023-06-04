import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SettingsRepository(this.sharedPref);
  // ignore: avoid_void_async

  final SharedPreferences sharedPref;
  void setCalenderImport({required bool value}) {
    sharedPref.setBool(SharedPrefKeys.isCalendarImportOpen, value);
  }

  Future<void> setThemeMode({required ThemeMode mode}) async {
    await sharedPref.setInt(SharedPrefKeys.themeMode, mode.index);
  }

  BehaviorSubject<ThemeMode> get themeMode => BehaviorSubject<ThemeMode>.seeded(
        ThemeMode.values[sharedPref.getInt(SharedPrefKeys.themeMode) ?? 0],
      );
  BehaviorSubject<bool> get isCalendarImportOpen =>
      BehaviorSubject<bool>.seeded(
        sharedPref.getBool(SharedPrefKeys.isCalendarImportOpen) ?? false,
      );
}

class SharedPrefKeys {
  static const String isCalendarImportOpen = 'isCalendarImportOpen';
  static const String themeMode = 'themeMode';
}
