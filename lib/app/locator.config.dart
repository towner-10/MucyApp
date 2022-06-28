// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../services/helper_dialog_service.dart' as _i4;
import '../services/sizing_service.dart' as _i6;
import '../services/storage_service.dart' as _i7;
import '../services/third_party_services_module.dart' as _i8;
import 'router.gr.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i4.HelperDialogService>(() => _i4.HelperDialogService());
  gh.singleton<_i5.MucyRouter>(thirdPartyServicesModule.autoRouter);
  gh.lazySingleton<_i6.SizingService>(() => _i6.SizingService());
  gh.lazySingleton<_i3.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.lazySingleton<_i7.StorageService>(() => _i7.StorageService());
  return get;
}

class _$ThirdPartyServicesModule extends _i8.ThirdPartyServicesModule {
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.SnackbarService get snackBarService => _i3.SnackbarService();
}
