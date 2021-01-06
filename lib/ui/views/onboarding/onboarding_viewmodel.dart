import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SizingService _sizingService = locator<SizingService>();
  final StorageService _storage = locator<StorageService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final int numPages = 3;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  String _name = "";
  String get currentName => _name;

  AssetImage get currentBackgroundImage {
    switch(_currentPage) {
      case 0:
        return Backgrounds.blueMucyBackground;
      default:
        return Backgrounds.defaultBackground;
    }
  }

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  String validateNameInput(String input) {
    if (input == "" || input == null) return 'That\'s not a name silly!';
    else return null;
  }

  SizingService getSizingService() {
    return _sizingService;
  }

  Future navigateToHome() async {
    _storage.name = _name;
    await _navigationService.navigateTo(Routes.homeView);
  }
}