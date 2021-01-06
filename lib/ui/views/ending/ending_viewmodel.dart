import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EndingViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final SizingService _sizingService = locator<SizingService>();
  final StorageService _storage = locator<StorageService>();

  final int numPages = 2;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  int get emotionIndex => _storage.emotionIndex;
  String get reward => _storage.reward;

  bool feelingBetter = true;

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}