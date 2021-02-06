import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/helper_dialog_service.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/utilities/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum BreatheState {
  In,
  Out,
  Hold
}

class BreatheViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SizingService _sizingService = locator<SizingService>();
  final HelperDialogService _dialogService = locator<HelperDialogService>();

  final int numPages = 2;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  BreatheState _breatheState = BreatheState.In;
  BreatheState get breatheState => _breatheState;

  int _breathCounter = 0;
  int _breatheStateCounter = 0;
  bool _lastBreatheAnimState = true;

  String get currentBreatheText {
    switch(_breatheState) {
      case BreatheState.In:
        return "Breathe In...";
      case BreatheState.Hold:
        return "Hold...";
      case BreatheState.Out:
        return "Breathe Out...";
    }
  }

  // true = forward (5 -> 0)
  // false = reverse (0 -> 5)
  void updateBreatheMode(bool value) {
    if (_lastBreatheAnimState == value) return;

    _breatheStateCounter++;

    if (_breatheStateCounter >= 3) {
      _breatheStateCounter = 0;
      _breathCounter++;

      if (_breathCounter == 2) createContinueButton();
      if (_breathCounter > 5) navigateToEnd();
    }

    switch(_breatheStateCounter) {
      case 0:
        _breatheState = BreatheState.In;
        break;
      case 1:
        _breatheState = BreatheState.Hold;
        break;
      case 2:
        _breatheState = BreatheState.Out;
    }

    _lastBreatheAnimState = value;

    notifyListeners();
  }

  void createContinueButton() {
    _dialogService.showCustomBottomSheet(
      child: FadeIn(
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
      )
    );
  }

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void navigateToEnd() {
    _navigationService.replaceWith(Routes.endingView);
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}