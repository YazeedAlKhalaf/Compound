import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> signOut() async {
    setBusy(true);
    await _authenticationService.signOut();
    await _navigationService.pushNamedAndRemoveUntil(Routes.signUpViewRoute);
  }
}
