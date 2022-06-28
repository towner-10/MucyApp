import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SizingService {

  static double _screenWidth = Get.width;
  static double _screenHeight = Get.height;
  static double _blockSizeHorizontal = _screenWidth / 100;
  static double _blockSizeVertical = _screenHeight / 100;
  static double _topPadding = Get.mediaQuery.padding.top;
  static double _bottomPadding = Get.mediaQuery.padding.bottom;

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  double get blockSizeHorizontal => _blockSizeHorizontal;
  double get blockSizeVertical => _blockSizeVertical;
  double get topPadding => _topPadding;
  double get bottomPadding => _bottomPadding;
}