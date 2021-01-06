import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mucy/app/locator.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:mucy/services/sizing_service.dart';
import 'package:mucy/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storage = locator<StorageService>();
  final SizingService _sizingService = locator<SizingService>();

  String get name {
    return _storage.name;
  }

  void navigateToAdultReward() {
    _navigationService.replaceWith(Routes.breatheView);
    //_navigationService.replaceWith(Routes.adultView);
  }

  SizingService getSizingService() {
    return _sizingService;
  }
}