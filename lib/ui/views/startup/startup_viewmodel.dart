import 'dart:ui';

import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  
  final MucyRouter _autoRouter = locator<MucyRouter>();
  final SizingService _sizingService = locator<SizingService>();
  final StorageService _storage = locator<StorageService>();

  SizingService getSizingService() {
    return _sizingService;
  }

  void navigateToOnboarding() {
    if (_storage.name != '') {
      _autoRouter.replace(HomeViewRoute());
    }
    else {
      _autoRouter.replace(OnboardingViewRoute());
    }
  }
}