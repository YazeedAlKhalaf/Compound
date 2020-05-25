import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future signUp({
    @required String fullName,
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
      fullName: fullName,
      email: email,
      password: password,
    );

    if (result is bool) {
      if (result) {
        _navigationService.pushNamedAndRemoveUntil(Routes.homeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later!',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }

    setBusy(false);
  }

  Future navigateToLoginView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.loginViewRoute);
  }
}
