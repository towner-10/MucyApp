import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'package:mucy/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {

  @singleton
  MucyRouter get autoRouter => MucyRouter(Get.key);

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  SnackbarService get snackBarService;
}