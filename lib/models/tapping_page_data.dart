import 'package:flutter/rendering.dart';

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
        return "Karate Chop";
      case TappingPoint.Eyebrow:
        return "Eyebrow";
      case TappingPoint.SideOfEye:
        return "Side of eye";
      case TappingPoint.UnderEye:
        return "Under eye";
      case TappingPoint.UnderNose:
        return "Under nose";
      case TappingPoint.Chin:
        return "Chin";
      case TappingPoint.Neck:
        return "Neck";
      case TappingPoint.Underarm:
        return "Underarm";
      case TappingPoint.TopOfHead:
        return "Top of head";
      default:
        return "Karate Chop";
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
            return "I will stay happy for myself and others.";
          case 1:
            return "It’s okay for me to not know how I feel.";
          case 2:
            return "Even though I feel sad, I love myself.";
          case 3:
            return "I can get through this.";
          default:
            return "";
        }
        break;

      case TappingPoint.Chin:
      case TappingPoint.Neck:
      case TappingPoint.Underarm:
      case TappingPoint.TopOfHead:
        switch(_emotionIndex) {
          case 0:
            return "I will stay positive!";
          case 1:
            return "My emotions will change.";
          case 2:
            return "Even though I feel sad, I can feel better.";
          case 3:
            return "Even though I’m upset, I love myself.";
          default:
            return "";
        }
        break;

      default:
        return "";
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