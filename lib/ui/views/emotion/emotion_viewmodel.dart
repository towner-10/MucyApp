import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmotionViewModel extends BaseViewModel {

  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SizingService _sizingService = locator<SizingService>();

  void saveEmotion(int index) {
    _storageService.emotionIndex = index;
    _navigationService.navigateTo(Routes.tappingView);
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}