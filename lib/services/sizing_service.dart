import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SizingService {

  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal;
  static double _blockSizeVertical;
  static double _topPadding;
  static double _bottomPadding;

  SizingService() {
    _screenWidth = Get.width;
    _screenHeight = Get.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;
    _topPadding = Get.mediaQuery.padding.top;
    _bottomPadding = Get.mediaQuery.padding.bottom;
  }

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  double get blockSizeHorizontal => _blockSizeHorizontal;
  double get blockSizeVertical => _blockSizeVertical;
  double get topPadding => _topPadding;
  double get bottomPadding => _bottomPadding;
}