import 'package:flutter/widgets.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/helper_dialog_service.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stacked/stacked.dart';

class AdultViewModel extends BaseViewModel {

  final MucyRouter _autoRouter = locator<MucyRouter>();
  final StorageService _storageService = locator<StorageService>();
  final SizingService _sizingService = locator<SizingService>();
  final HelperDialogService _helperDialogService = locator<HelperDialogService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _reward = '';

  SizingService getSizingService() {
    return _sizingService;
  }

  void saveReward() {
    _storageService.reward = _reward;
  }

  void updateReward(String? reward) {
    _reward = reward!;
    notifyListeners();
  }

  String? validateRewardInput(String? input) {
    if (input == '' || input == null) return 'please_enter_reward'.tr();
    else return null;
  }

  void navigateToMucyEmotion() {
    _autoRouter.navigate(EmotionViewRoute());
  }

  void openHelperSheet() {
    _helperDialogService.showDialog('what_is_this'.tr(), 'reward_dialog'.tr(), contentMaxLines: 5);
  }
}