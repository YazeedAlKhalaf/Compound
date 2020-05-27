import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/ui/global/custom_base_view_model.dart';
import 'package:flutter/foundation.dart';

class SignUpViewModel extends CustomBaseViewModel {
  Future signUp({
    @required String fullName,
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await authenticationService.signUpWithEmail(
      fullName: fullName,
      email: email,
      password: password,
    );

    if (result is bool) {
      if (result) {
        await analyticsService.logSignUp();
        await navigationService.pushNamedAndRemoveUntil(Routes.homeViewRoute);
      } else {
        await dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later!',
        );
      }
    } else {
      await dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }

    setBusy(false);
  }

  Future navigateToLoginView() async {
    await navigationService.pushNamedAndRemoveUntil(Routes.loginViewRoute);
  }
}
