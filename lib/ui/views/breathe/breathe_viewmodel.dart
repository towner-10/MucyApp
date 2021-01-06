import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/helper_dialog_service.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BreatheViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SizingService _sizingService = locator<SizingService>();
  final StorageService _storage = locator<StorageService>();
  final HelperDialogService _dialogService = locator<HelperDialogService>();

  final int numPages = 2;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  bool _breatheIn = true;
  bool get breatheIn => _breatheIn;

  int _breathCounter = 0;

  int getEmotionIndex() {
    return _storage.emotionIndex;
  }

  void updateBreatheMode(bool value) {
    _breatheIn = value;
    _breathCounter++;

    if (_breathCounter == 4) createContinueButton();
    if (_breathCounter > 8) navigateToEnd();

    notifyListeners();
  }

  void createContinueButton() {
    _dialogService.showCustomBottomSheet(
      child: PlayAnimation<double>(
        tween: Tween(
          begin: 0.0,
          end: 1.0
        ),
        builder: (context, child, value) {
          return Opacity(
            opacity: value,
            child: Container(
              margin: EdgeInsets.all(15).copyWith(
                bottom: 15 + _sizingService.bottomPadding
              ),
              height: 58.0,
              child: InkWell(
                onTap: () => navigateToEnd(),
                child: Center(
                  child: Text(
                    'Continue',
                    style: kBottomButtonTextStyle
                  )
                )
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFF282E4E),
              ),
            ),
          );
        },
      )
    );
  }

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void navigateToEnd() {
    _navigationService.navigateTo(Routes.endingView);
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}