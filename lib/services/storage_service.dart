import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StorageService {

  late final Box _settings;
  late final Box _tapping;

  StorageService() {
    initialize();
  }

  Future initialize() async {
    await Hive.initFlutter();
    
    _settings = await Hive.openBox("settings");
    _tapping = await Hive.openBox("tapping");
  }

  set name(String value) => _settings.put('name', value);
  String get name => _settings.get('name', defaultValue: '');

  set reward(String value) => _tapping.put('reward', value);
  String get reward => _tapping.get('reward', defaultValue: '');

  set emotionIndex(int value) => _tapping.put('emotion', value);
  int get emotionIndex => _tapping.get('emotion', defaultValue: '');

  set firstTapping(bool value) => _tapping.put('firstTapping', value);
  bool get firstTapping => _tapping.get('firstTapping', defaultValue: true);
}