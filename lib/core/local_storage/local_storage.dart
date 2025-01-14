import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocalStorage {
  const LocalStorage(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  String? getString(String key) {
    try {
      return _sharedPreferences.getString(key);
    } on PlatformException catch (e, stackTrace) {
      log('Error getting string $key', error: e, stackTrace: stackTrace);
    }

    return null;
  }

  Future<bool> deleteString(String key) async {
    try {
      return _sharedPreferences.remove(key);
    } on PlatformException catch (e, stackTrace) {
      log('Error deleting string $key', error: e, stackTrace: stackTrace);
    }

    return false;
  }

  Future<bool> setString(String key, String value) async {
    try {
      return _sharedPreferences.setString(key, value);
    } on PlatformException catch (e, stackTrace) {
      log('Error setting string $key', error: e, stackTrace: stackTrace);
    }

    return false;
  }
}
