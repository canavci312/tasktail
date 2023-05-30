import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SettingsRepository() {
    init();
  }
  // ignore: avoid_void_async
  void init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPref;
  void setCalenderImport({required bool value}) {
    sharedPref.setBool(SharedPrefKeys.isCalendarImportOpen, value);
  }

  bool get isCalendarImportOpen =>
      sharedPref.getBool(SharedPrefKeys.isCalendarImportOpen) ?? false;
}

class SharedPrefKeys {
  static const String isCalendarImportOpen = 'isCalendarImportOpen';
}
