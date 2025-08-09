import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends GetxService {
  static LocalStorageService get to => Get.find();

  late final FlutterSecureStorage _secureStorage;
  SharedPreferences? _prefs;
  bool _isInitialized = false;

  Future<LocalStorageService> init() async {
    if (_isInitialized) return this;
    
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _secureStorage = const FlutterSecureStorage();
      
      // Initialize SharedPreferences with error handling
      try {
        _prefs = await SharedPreferences.getInstance();
      } catch (e) {
        debugPrint('SharedPreferences initialization error: $e');
        // Continue without SharedPreferences, it will be lazy-loaded on first use
      }
      
      _isInitialized = true;
      return this;
    } catch (e) {
      debugPrint('Error in LocalStorageService.init(): $e');
      rethrow;
    }
  }

  Future<SharedPreferences> get _prefsInstance async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  // Secure Storage Methods
  Future<void> writeSecure(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      debugPrint('Error in writeSecure: $e');
      rethrow;
    }
  }

  Future<String?> readSecure(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      debugPrint('Error in readSecure: $e');
      return null;
    }
  }

  // Regular Preferences Methods
  Future<void> writePref(String key, String value) async {
    try {
      final prefs = await _prefsInstance;
      await prefs.setString(key, value);
    } catch (e) {
      debugPrint('Error in writePref: $e');
      rethrow;
    }
  }

  Future<String?> readPref(String key) async {
    try {
      final prefs = await _prefsInstance;
      return prefs.getString(key);
    } catch (e) {
      debugPrint('Error in readPref: $e');
      return null;
    }
  }

  Future<void> removePref(String key) async {
    try {
      final prefs = await _prefsInstance;
      await prefs.remove(key);
    } catch (e) {
      debugPrint('Error in removePref: $e');
      rethrow;
    }
  }
}