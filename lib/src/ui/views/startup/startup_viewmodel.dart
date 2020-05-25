import 'dart:async';

import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartup() async {
    var isUserLoggedIn = await _authenticationService.isUserLoggedIn();

    if (isUserLoggedIn) {
      await navigateToHomeView();
    } else {
      await navigateToSignUpView();
    }
  }

  Future navigateToHomeView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeViewRoute);
  }

  Future navigateToSignUpView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.signUpViewRoute);
  }

  Future navigateToLoginView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.loginViewRoute);
  }
}
