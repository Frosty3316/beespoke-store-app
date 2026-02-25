import 'package:hive/hive.dart';

class LocalStorageService {
  final Box preferencesBox = Hive.box('preferences');

  void setPreference(int productId, bool liked) {
    preferencesBox.put(productId, liked);
  }

  bool? getPreference(int productId) {
    return preferencesBox.get(productId);
  }
}