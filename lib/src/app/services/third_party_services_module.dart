import 'package:compound/src/app/services/authentication_service.dart';
import 'package:compound/src/app/services/cloud_storage_service.dart';
import 'package:compound/src/app/services/firestore_service.dart';
import 'package:compound/src/app/services/push_notification_service.dart';
import 'package:compound/src/app/utils/image_selector.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackBarService;
  @lazySingleton
  AuthenticationService get authenticationService;
  @lazySingleton
  FirestoreService get firestoreService;
  @lazySingleton
  CloudStorageService get cloudStorageService;
  @lazySingleton
  ImageSelector get imageSelector;
  @lazySingleton
  PushNotificationService get pushNotificationService;
}
