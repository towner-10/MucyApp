import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StorageService {

  Box _settings;

  StorageService() {
    initalize();
  }

  Future initalize() async {
    await Hive.initFlutter();
    
    _settings = await Hive.openBox("settings");
  }

  set name(String value) => _settings.put('name', value);
  String get name => _settings.get('name', defaultValue: '');

  set reward(String value) => _settings.put('reward', value);
  String get reward => _settings.get('reward', defaultValue: '');

  set emotionIndex(int value) => _settings.put('emotion', value);
  int get emotionIndex => _settings.get('emotion', defaultValue: '');
}