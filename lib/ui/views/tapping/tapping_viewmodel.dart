import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/models/tapping_page_data.dart';
import 'package:mucy/services/helper_dialog_service.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TappingViewModel extends BaseViewModel {

  static final StorageService _storageService = locator<StorageService>();

  final List<TappingPageData> data = [
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.KarateChop, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.Eyebrow, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.SideOfEye, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.UnderEye, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.UnderNose, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.Chin, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.Neck, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.Underarm, _storageService.emotionIndex),
    TappingPageData(const Color(0xFF3B73C9), TappingPoint.TopOfHead, _storageService.emotionIndex),
  ];

  final SizingService _sizingService = locator<SizingService>();
  final HelperDialogService _dialogService = locator<HelperDialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  int index = 0;

  bool runAnimation = true;

  bool _firstBuild = true;

  void nextPage() {
    runAnimation = !runAnimation;
    index++;

    if (index > 8) {
      _navigationService.clearStackAndShow(Routes.breatheView);
      return;
    }

    notifyListeners();
  }

  void startup() {
    if (_firstBuild == true) {
      showHelpDialog();
      _firstBuild = false;
    }
  }

  void showHelpDialog() {
    _dialogService.showDialog("What to do?", "1. Repeat the phrase\n\n2. Gently tap the highlighted area on yourself");
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}