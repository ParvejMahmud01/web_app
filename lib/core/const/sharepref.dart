// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String _userDataKey = 'user-data';
  static const String _rememberMeKey = 'remember-me';
  static const String _emailKey = 'email';
  static const String _nameKey = 'name';
  static const String _passwordKey = 'password';
  static const String _tokenKey = 'token';
  static const String _forgotTokenKey = 'forgot-token';
  static const String _idKey = 'id';
  static const String _fcmTokenKey = 'fcm-token';
  static const String _subcriptionKey = 'subcription';
  static const String _roleKey = 'role';
  static const String _uid = 'uid';
  static const String _accessGroupKey = 'accessGroup';
  static const String _languageKey = 'selected-language';
  static const String _selectedIndexKey = "selectedIndex";
  static const String _countryKey = "country";
  static const String _registratioTtokenKey = "registration-token";
  static const String _onboardingShownKey = 'onboarding-shown';

  static bool rememberMe = false;
  static String? savedEmail;
  static String? savedName;
  // static String? savedPassword;
  static String? token;

  static Future<void> saveRememberMe(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberMeKey, value);
  }

  static Future<bool> getRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberMeKey) ?? false;
  }

  static Future<void> saveFcmToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_fcmTokenKey, token);
  }

  // Method to get FCM token
  static Future<String?> getFcmToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_fcmTokenKey);
  }

  static Future<void> storeUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save userData as JSON string
    String userDataString = json.encode(userData);
    await prefs.setString('userData', userDataString);

    if (kDebugMode) {
      print("UserData Stored: $userDataString");
    } // Add this line to verify data
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString('userData');

    if (userDataString != null) {
      try {
        // Decode the JSON string into a map
        return Map<String, dynamic>.from(json.decode(userDataString));
      } catch (e) {
        if (kDebugMode) {
          print("Error decoding userData: $e");
        }
      }
    }
    return null;
  }

  // Get saved email
  static Future<void> saveEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_emailKey, email);
    // print("Role saved: $role"); // Add this to verify the role is saved
  }

  static Future<String?> getSavedEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_emailKey);
  }

  static Future<void> savePassword(String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_passwordKey, password);
    // print("Role saved: $role"); // Add this to verify the role is saved
  }

  static Future<String?> getSavedPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_passwordKey);
  }

  static Future<String?> getSavedName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_nameKey); // Retrieve the name
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
  }

  // Get saved token
  static Future<String?> getSavedToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_tokenKey); // Retrieve token
  }

  static Future<void> saveRegistrationToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_registratioTtokenKey, token);
  }

  // Get saved token
  static Future<String?> getSavedRegistrationToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_registratioTtokenKey); // Retrieve token
  }

  static Future<void> saveCountry(String country) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_countryKey, country);
  }

  // Get saved token
  static Future<String?> getSavedCountry() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_countryKey); // Retrieve token
  }

  static Future<void> forgotSaveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_forgotTokenKey, token);
  }

  // Get saved token
  static Future<String?> forgotGetToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_forgotTokenKey); // Retrieve token
  }

  static Future<void> saveAccessGroup(List<String> accessGroup) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(_accessGroupKey, accessGroup);
  }

  // Retrieve saved access group as a list of strings
  static Future<List<String>?> getAccessGroup() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(_accessGroupKey); // Retrieve list
  }

  static Future<void> saveSubcription(bool subscription) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(_subcriptionKey, subscription);
  }

  static Future<bool?> getSavedSubcription() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_subcriptionKey); // Retrieve subscription
  }

  static Future<void> saveRole(String role) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_roleKey, role);
    // print("Role saved: $role"); // Add this to verify the role is saved
  }

  static Future<String?> getSavedRole() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? role = sharedPreferences.getString(_roleKey);
    // print("Fetched role: $role"); // Add this to verify the fetched role
    return role;
  }

  static Future<void> saveUserId(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_idKey, id);
  }

  static Future<String?> getSavedUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_idKey);
  }

  static Future<void> saveSelectedLanguage(Locale locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_languageKey, locale.languageCode);
  }

  // Retrieve selected language
  static Future<Locale> getSelectedLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? languageCode = sharedPreferences.getString(_languageKey);

    switch (languageCode) {
      case 'es':
        return const Locale('es', 'ES');

      case 'fr':
        return const Locale('fr', 'FR');
      default:
        return const Locale('en', 'US'); // Default to English
    }
  }

  static Future<void> saveSelectedIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedIndexKey, index);
  }

  static Future<int> getSelectedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_selectedIndexKey) ?? 0; // Default to 0 if not found
  }

  static Future<void> setOnboardingShown(bool shown) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingShownKey, shown);
  }

  // Check if onboarding was shown
  static Future<bool> isOnboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingShownKey) ??
        false; // default false = not shown yet
  }

  // Method to clear all saved preferences (clearAll)
  static Future<void> clearAll({bool keepRemembered = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tokenKey);
    await prefs.remove(_fcmTokenKey);
    await prefs.remove(_subcriptionKey);
    await prefs.remove(_roleKey);
    await prefs.remove(_uid);
    await prefs.remove(_idKey);
    await prefs.remove(_countryKey);

    if (!keepRemembered) {
      await prefs.remove(_emailKey);
      await prefs.remove(_passwordKey);
      await prefs.remove(_rememberMeKey);
    }
  }
}
