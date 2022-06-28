import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';

enum TappingPoint {
  KarateChop,
  Eyebrow,
  SideOfEye,
  UnderEye,
  UnderNose,
  Chin,
  Neck,
  Underarm,
  TopOfHead
}

class TappingPageData {

  final Color _color;
  Color get color => _color;

  final TappingPoint _point;
  final int _emotionIndex;

  TappingPageData(this._color, this._point, this._emotionIndex);

  String get title {
    switch(_point) {
      case TappingPoint.KarateChop:
        return 'karate_chop'.tr();
      case TappingPoint.Eyebrow:
        return 'eyebrow'.tr();
      case TappingPoint.SideOfEye:
        return 'side_of_eye'.tr();
      case TappingPoint.UnderEye:
        return 'under_eye'.tr();
      case TappingPoint.UnderNose:
        return 'under_nose'.tr();
      case TappingPoint.Chin:
        return 'chin'.tr();
      case TappingPoint.Neck:
        return 'neck'.tr();
      case TappingPoint.Underarm:
        return 'underarm'.tr();
      case TappingPoint.TopOfHead:
        return 'top_of_head'.tr();
      default:
        return 'karate_chop'.tr();
    }
  }

  String get quote {
    switch(_point) {
      case TappingPoint.KarateChop:
      case TappingPoint.Eyebrow:
      case TappingPoint.SideOfEye:
      case TappingPoint.UnderEye:
      case TappingPoint.UnderNose:
        switch(_emotionIndex) {
          case 0:
            return 'quote_0'.tr();
          case 1:
            return 'quote_1'.tr();
          case 2:
            return 'quote_2'.tr();
          case 3:
            return 'quote_3'.tr();
          default:
            return '';
        }

      case TappingPoint.Chin:
      case TappingPoint.Neck:
      case TappingPoint.Underarm:
      case TappingPoint.TopOfHead:
        switch(_emotionIndex) {
          case 0:
            return 'quote_4'.tr();
          case 1:
            return 'quote_5'.tr();
          case 2:
            return 'quote_6'.tr();
          case 3:
            return 'quote_7'.tr();
          default:
            return '';
        }

      default:
        return '';
    }
  }

  String get imagePath {
    switch(_point) {
      case TappingPoint.KarateChop:
        return "assets/images/KarateFullBody.png";
      case TappingPoint.Eyebrow:
        return "assets/images/Brows.png";
      case TappingPoint.SideOfEye:
        return "assets/images/Sides.png";
      case TappingPoint.UnderEye:
        return "assets/images/Under.png";
      case TappingPoint.UnderNose:
        return "assets/images/Nose.png";
      case TappingPoint.Chin:
        return "assets/images/Chin.png";
      case TappingPoint.Neck:
        return "assets/images/Neck.png";
      case TappingPoint.Underarm:
        return "assets/images/Underarms.png";
      case TappingPoint.TopOfHead:
        return "assets/images/Head.png";
      default:
        return "assets/images/KarateFullBody.png";
    }
  }
}