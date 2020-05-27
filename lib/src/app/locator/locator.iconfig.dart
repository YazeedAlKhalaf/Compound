// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:compound/src/app/services/third_party_services_module.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:compound/src/app/services/cloud_storage_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:compound/src/app/services/firestore_service.dart';
import 'package:compound/src/app/utils/image_selector.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AuthenticationService>(
      () => thirdPartyServicesModule.authenticationService);
  g.registerLazySingleton<CloudStorageService>(
      () => thirdPartyServicesModule.cloudStorageService);
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirestoreService>(
      () => thirdPartyServicesModule.firestoreService);
  g.registerLazySingleton<ImageSelector>(
      () => thirdPartyServicesModule.imageSelector);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  CloudStorageService get cloudStorageService => CloudStorageService();
  @override
  DialogService get dialogService => DialogService();
  @override
  FirestoreService get firestoreService => FirestoreService();
  @override
  ImageSelector get imageSelector => ImageSelector();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
