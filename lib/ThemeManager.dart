import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  bool isDarkMode = false;

  factory ThemeManager() {
    return _instance;
  }

  ThemeManager._internal();

  Future<void> loadUserTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('darkMode') ?? false;
  }

  Future<void> saveUserTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', value);
    isDarkMode = value;
  }
}