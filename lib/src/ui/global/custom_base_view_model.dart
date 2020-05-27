import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/models/user.dart';
import 'package:compound/src/app/services/analytics_service.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:compound/src/app/services/cloud_storage_service.dart';
import 'package:compound/src/app/services/firestore_service.dart';
import 'package:compound/src/app/services/push_notification_service.dart';
import 'package:compound/src/app/utils/image_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final FirestoreService firestoreService = locator<FirestoreService>();
  final DialogService dialogService = locator<DialogService>();
  final NavigationService navigationService = locator<NavigationService>();
  final ImageSelector imageSelector = locator<ImageSelector>();
  final CloudStorageService cloudStorageService =
      locator<CloudStorageService>();
  final PushNotificationService pushNotificationService =
      locator<PushNotificationService>();
  final AnalyticsService analyticsService = locator<AnalyticsService>();

  User get currentUser => authenticationService.currentUser;
}
