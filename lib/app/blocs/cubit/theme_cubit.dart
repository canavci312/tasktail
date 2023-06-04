import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/data/repositories/settings_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._settingsRepository) : super(ThemeMode.system);
  final SettingsRepository _settingsRepository;
  StreamSubscription<ThemeMode>? _subs;
  void listenThemeSettings() {
    _subs = _settingsRepository.themeMode.listen((event) {
      emit(event);
    });
  }

  @override
  Future<void> close() {
    _subs?.cancel();
    return super.close();
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    await _settingsRepository.setThemeMode(mode: mode);
    emit(mode);
  }
}
