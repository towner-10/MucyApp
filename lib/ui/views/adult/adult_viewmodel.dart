import 'package:flutter/widgets.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/helper_dialog_service.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdultViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final SizingService _sizingService = locator<SizingService>();
  final HelperDialogService _helperDialogService = locator<HelperDialogService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _reward = "";

  SizingService getSizingService() {
    return _sizingService;
  }

  void saveReward() {
    _storageService.reward = _reward;
  }

  void updateReward(String reward) {
    _reward = reward;
    notifyListeners();
  }

  String validateRewardInput(String input) {
    if (input == "" || input == null) return 'Please enter a reward!';
    else return null;
  }

  void navigateToMucyEmotion() {
    _navigationService.navigateTo(Routes.emotionView);
  }

  void openHelperSheet() {
    _helperDialogService.showDialog("What is this?", "Rewards are a cool way for children to be engaged in maintaining their mental wellbeing. Feel free to assign any reward for your child such as monitored screen time, a special treat, and more.");
  }
}