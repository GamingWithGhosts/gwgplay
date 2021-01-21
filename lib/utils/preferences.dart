import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String _prefKey = "lazarusnetwork_";
const String _kDefaultLanguage = "en";

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Preferences preferences = Preferences();

class Preferences {
  /// ----------------------------------------------------------
  /// Generic routine to fetch a preference
  /// ----------------------------------------------------------
  Future<String> _getApplicationSavedInformation(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_prefKey + name) ?? '';
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves a preference
  /// ----------------------------------------------------------
  Future<bool> _setApplicationSavedInformation(String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(_prefKey + name, value);
  }

  /// ----------------------------------------------------------
  /// Method that saves/restores the preferred language
  /// ----------------------------------------------------------
  getPreferredLanguage() async {
    return _getApplicationSavedInformation('language');
  }
  setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }
  String get defaultLanguage => _kDefaultLanguage;

  /// ----------------------------------------------------------
  /// Method that saves/retrieves whether intro screen was shown
  /// ----------------------------------------------------------
  getIntroductionInformation() async {
    return _getApplicationSavedInformation('intro');
  }
  setIntroductionInformation(String status) async {
    return _setApplicationSavedInformation('intro', status);
  }

  // ------------------ SINGLETON -----------------------
  static final Preferences _preferences = Preferences._internal();
  factory Preferences(){
    return _preferences;
  }
  Preferences._internal();
}