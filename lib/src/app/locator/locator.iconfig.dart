// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:compound/src/app/services/analytics_service.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:compound/src/app/services/cloud_storage_service.dart';
import 'package:compound/src/app/services/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:compound/src/app/services/dynamic_link_service.dart';
import 'package:compound/src/app/services/firestore_service.dart';
import 'package:compound/src/app/utils/image_selector.dart';
import 'package:compound/src/app/services/push_notification_service.dart';
import 'package:compound/src/app/services/remote_config_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<CloudStorageService>(() => CloudStorageService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<DynamicLinkService>(() => DynamicLinkService());
  g.registerLazySingleton<FirestoreService>(() => FirestoreService());
  g.registerLazySingleton<ImageSelector>(() => ImageSelector());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<PushNotificationService>(
      () => PushNotificationService());
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);

  //Eager singletons must be registered in the right order
  g.registerSingletonAsync<RemoteConfigService>(
      () => RemoteConfigService.getInstance());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
