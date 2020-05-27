// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:compound/src/app/services/third_party_services_module.dart';
import 'package:compound/src/app/services/analytics_service.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:compound/src/app/services/cloud_storage_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:compound/src/app/services/dynamic_link_service.dart';
import 'package:compound/src/app/services/firestore_service.dart';
import 'package:compound/src/app/utils/image_selector.dart';
import 'package:compound/src/app/services/push_notification_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AnalyticsService>(
      () => thirdPartyServicesModule.analyticsService);
  g.registerLazySingleton<AuthenticationService>(
      () => thirdPartyServicesModule.authenticationService);
  g.registerLazySingleton<CloudStorageService>(
      () => thirdPartyServicesModule.cloudStorageService);
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<DynamicLinkService>(
      () => thirdPartyServicesModule.dynamicLinkService);
  g.registerLazySingleton<FirestoreService>(
      () => thirdPartyServicesModule.firestoreService);
  g.registerLazySingleton<ImageSelector>(
      () => thirdPartyServicesModule.imageSelector);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<PushNotificationService>(
      () => thirdPartyServicesModule.pushNotificationService);
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  AnalyticsService get analyticsService => AnalyticsService();
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  CloudStorageService get cloudStorageService => CloudStorageService();
  @override
  DialogService get dialogService => DialogService();
  @override
  DynamicLinkService get dynamicLinkService => DynamicLinkService();
  @override
  FirestoreService get firestoreService => FirestoreService();
  @override
  ImageSelector get imageSelector => ImageSelector();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  PushNotificationService get pushNotificationService =>
      PushNotificationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
