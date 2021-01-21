import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gwgplay/models/user_model.dart';
import 'package:gwgplay/utils/user_auth.dart';

// Create storage instance
const String _storageKey = "gwgplay_";
final storage = new FlutterSecureStorage();

Future<String> getStoredValue(String _key) async {
  return await storage.read(key: _storageKey + _key);
}

Future<Map<String, String>> getAllStoredValues() async {
  Map<String, String> allValues = await storage.readAll();
  return allValues;
}

Future<void> deleteStoredValue(String _key) async {
  return await storage.delete(key: _storageKey + _key);
}

Future<void> deleteAllStoredValues() async {
  return await storage.deleteAll();
}

Future<void> writeStoredValues(String _key, String _value) async {
  return await storage.write(key: _key, value: _value);
}

Future<void> saveUserInfo(AuthenticatedUser _authenticatedUser) async {
  await storage.write(
      key: _storageKey + "authenticatedUser",
      value: _authenticatedUser.toString());
}

Future<void> deleteUserInfo() async {
  await storage.delete(key: _storageKey + "authenticatedUser");
}

Future<AuthenticatedUser> getUserInfo() async {
  String _authenticatedUser =
  await storage.read(key: _storageKey + "authenticatedUser");
  if (_authenticatedUser != null) {
    authenticatedUser = new AuthenticatedUser.fromCSV(_authenticatedUser);
    return authenticatedUser;
  } else {
    return null;
  }
}