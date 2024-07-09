import 'package:pokedex/service/shared_preferences_service.dart';

class LocalStorageService {
  final SharedPreferenceService prefs;

  const LocalStorageService({
    required this.prefs,
  });

  Future<void> removeKey(String key) async {
    await prefs.removeValue(key);
  }

  Future<void> clearAllData() async {
    await prefs.clearData();
  }
}
