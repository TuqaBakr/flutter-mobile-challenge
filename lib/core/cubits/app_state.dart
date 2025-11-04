import 'dart:ui';

abstract class MyAppState {}

class AppInitialState extends MyAppState {}

class AppThemeChangedState extends MyAppState {}

class ChangeLocaleState extends MyAppState {
  final Locale locale ;
  ChangeLocaleState(this.locale) ;
}



