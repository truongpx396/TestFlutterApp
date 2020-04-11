import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences _prefs;

  static const String kDemoNumberPrefKey = 'demo_number_pref';
  static const String kDemoBooleanPrefKey = 'demo_boolean_pref';
  static const String kIdTokenPrefKey = 'kIdTokenPrefKey';

  Future<Null> setNumberPref(int val) async {
    await _prefs.setInt(kDemoNumberPrefKey, val);
  }

  static Future<Null> setBooleanPref(bool val) async {
    await _prefs.setBool(kDemoBooleanPrefKey, val);
  }

  static Future<Null> setIdToken(String val) async {
    await _prefs.setString(kIdTokenPrefKey, val);
  }

  static bool loadBooleanKey() {
    return _prefs.getBool(kDemoBooleanPrefKey) ?? false;
  }

  static String getIdToken() {
    return _prefs.getString(kIdTokenPrefKey) ?? "";
  }
}
