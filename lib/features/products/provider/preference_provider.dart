import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../services/local_storage_service.dart';

final preferenceProvider =
    StateNotifierProvider<PreferenceNotifier, Map<int, bool>>(
        (ref) => PreferenceNotifier());

class PreferenceNotifier extends StateNotifier<Map<int, bool>> {
  PreferenceNotifier() : super({}) {
    _loadPreferences();
  }

  final _storage = LocalStorageService();

  void _loadPreferences() {
    final Box box = Hive.box('preferences');

    final Map<int, bool> loaded = {};

    for (var key in box.keys) {
      final value = box.get(key);
      if (key is int && value is bool) {
        loaded[key] = value;
      }
    }

    state = loaded;
  }

  void setPreference(int productId, bool liked) {
    _storage.setPreference(productId, liked);
    state = {...state, productId: liked};
  }
}