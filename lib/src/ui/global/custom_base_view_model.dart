import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/models/user.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:compound/src/app/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final FirestoreService firestoreService = locator<FirestoreService>();
  final DialogService dialogService = locator<DialogService>();
  final NavigationService navigationService = locator<NavigationService>();

  User get currentUser => authenticationService.currentUser;
}
