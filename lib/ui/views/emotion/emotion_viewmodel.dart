import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';

class EmotionViewModel extends BaseViewModel {

  final StorageService _storageService = locator<StorageService>();
  final MucyRouter _autoRouter = locator<MucyRouter>();
  final SizingService _sizingService = locator<SizingService>();

  void saveEmotion(int index) {
    _storageService.emotionIndex = index;
    _autoRouter.navigate(TappingViewRoute());
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}