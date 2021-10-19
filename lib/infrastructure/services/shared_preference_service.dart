
import 'package:demoapp/infrastructure/commons/constants/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static SharedPreferenceService? _instance;
  static SharedPreferences? _preferences;
  static Future<SharedPreferenceService?> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferenceService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }
  // General Methods: ----------------------------------------------------------

  static clearPreference() async {
    await getInstance();
    await _preferences!.clear();
  }

  static Future<void> saveValue(String key, String value) async {
    await getInstance();
    await _preferences!.setString(key, value);
  }

  static Future<String?> getValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getString(key);
    } catch (e) {
      return '';
    }
  }

  static Future<void> removeValue(String key) async {
    await getInstance();
    try {
      await _preferences!.remove(key);
    } catch (e) {
      print("$e");
    }
  }

  static Future<bool> checkIsKeyAvailable(String key) async {
    await getInstance();
    return _preferences!.containsKey(key);
  }

  //token
  static Future<String?> get getAuthToken async {
    await getInstance();
    return _preferences!.getString(StorageConstants.AuthToken);
  }

  static Future<void> saveAuthToken(String authToken) async {
    await getInstance();
    await _preferences!.setString(StorageConstants.AuthToken, authToken);
  }

  //version number
  static Future<String?> get getVersionNumber async {
    await getInstance();
    return _preferences!.getString(StorageConstants.VersionNumberKey);
  }

  static Future<void> saveVersionNumber(String versionNumberKey) async {
    await getInstance();
    await _preferences!.setString(
        StorageConstants.VersionNumberKey, versionNumberKey);
  }

  static Future<void> saveVisit(bool visitBool) async {
    await getInstance();
    await _preferences!.setBool(StorageConstants.VisitBoolean, visitBool);
  }

  static Future<bool?> get getVisitBool async {
    await getInstance();
    return _preferences!.getBool(StorageConstants.VisitBoolean);
  }
}
