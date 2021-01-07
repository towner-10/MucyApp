import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SizingService _sizingService = locator<SizingService>();
  final StorageService _storage = locator<StorageService>();

  SizingService getSizingService() {
    return _sizingService;
  }

  void navigateToOnboarding() {
    _navigationService.config(
      defaultTransition: NavigationTransition.RightToLeft
    );

    if (_storage.name != '') {
      _navigationService.replaceWith(Routes.homeView);
    }
    else {
      _navigationService.replaceWith(Routes.onboardingView);
    }
  }
}