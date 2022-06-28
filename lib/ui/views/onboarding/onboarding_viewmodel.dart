import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:mucy/utilities/backgrounds.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {

  final MucyRouter _autoRouter = locator<MucyRouter>();
  final SizingService _sizingService = locator<SizingService>();
  final StorageService _storage = locator<StorageService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final int numPages = 3;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  String _name = "";
  String get currentName => _name;

  BoxDecoration get currentBackgroundDecoration {
    switch(_currentPage) {
      case 0:
        return BoxDecoration(
          color: Backgrounds.defaultBackgroundColor,
          image: DecorationImage(
            image: Backgrounds.blueMucyBackground,
            fit: BoxFit.fitHeight
          )
        );
      default:
        return BoxDecoration(
          color: Backgrounds.defaultBackgroundColor
        );
    }
  }

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void updateName(String? name) {
    _name = name!;
    notifyListeners();
  }

  String? validateNameInput(String? input) {
    if (input == "" || input == null) return 'That\'s not a name silly!';
    else return null;
  }

  SizingService getSizingService() {
    return _sizingService;
  }

  Future navigateToHome() async {
    _storage.name = _name;
    await _autoRouter.replace(HomeViewRoute());
  }
}