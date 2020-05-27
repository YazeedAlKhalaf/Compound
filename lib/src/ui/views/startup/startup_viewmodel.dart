import 'dart:async';

import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/ui/global/custom_base_view_model.dart';

class StartupViewModel extends CustomBaseViewModel {
  Future handleStartup() async {
    // Handle Dynamic Links
    await dynamicLinkService.handleDynamicLinks();
    // Handle Push Notifications
    await pushNotificationService.initialize();

    var isUserLoggedIn = await authenticationService.isUserLoggedIn();

    if (isUserLoggedIn) {
      await navigateToHomeView();
    } else {
      await navigateToSignUpView();
    }
  }

  Future navigateToHomeView() async {
    await navigationService.pushNamedAndRemoveUntil(Routes.homeViewRoute);
  }

  Future navigateToSignUpView() async {
    await navigationService.pushNamedAndRemoveUntil(Routes.signUpViewRoute);
  }

  Future navigateToLoginView() async {
    await navigationService.pushNamedAndRemoveUntil(Routes.loginViewRoute);
  }
}
