import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<MyAppState> {
  AppCubit() : super(AppInitialState());

 bool isDark= false;
  Locale _locale = const Locale('en') ;

  Locale get currentLocal => _locale ;

  void changeThemeMode() {
    isDark = !isDark;
    emit(AppThemeChangedState());
  }

  void setDarkMode() {
    if (!isDark) changeThemeMode(); // only toggle if not already dark
  }

  void setLightMode() {
    if (isDark) changeThemeMode(); // only toggle if not already light
  }

  void changeLocale(Locale locale) {
    _locale = locale ;
    emit(ChangeLocaleState(locale)) ;
  }

 }
