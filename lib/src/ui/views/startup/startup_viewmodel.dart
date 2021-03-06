import 'dart:async';

import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/ui/global/custom_base_view_model.dart';

class StartupViewModel extends CustomBaseViewModel {
  Future handleStartup() async {
    // Handle Dynamic Links
    await dynamicLinkService.handleDynamicLinks();
    // Handle Remote Config
    await remoteConfigService.initialize();
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
    await navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  Future navigateToSignUpView() async {
    await navigationService.pushNamedAndRemoveUntil(Routes.signUpView);
  }

  Future navigateToLoginView() async {
    await navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }
}
