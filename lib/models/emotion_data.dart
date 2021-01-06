import 'package:flutter/rendering.dart';

class EmotionData {

  static final List<EmotionData> emotionData = [
    new EmotionData(new AssetImage('assets/images/pinkMucyHead.png'), const Color(0xFFCC708A), "Happy", 0),
    new EmotionData(new AssetImage('assets/images/lightBlueMucyHead.png'), const Color(0xFF6776C1), "So-So", 1),
    new EmotionData(new AssetImage('assets/images/blueMucyHead.png'), const Color(0xFF282E4E), "Sad", 2),
    new EmotionData(new AssetImage('assets/images/darkMucyHead.png'), const Color(0xFF191E32), "Upset", 3)
  ];

  final ImageProvider _image;
  ImageProvider get image => _image;

  final Color _color;
  Color get color => _color;

  final String _name;
  String get name => _name;

  final int _index;
  int get index => _index;

  EmotionData(this._image, this._color, this._name, this._index);
}