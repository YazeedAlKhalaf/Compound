import 'dart:async';

import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartup() async {
    Timer(
      Duration(
        seconds: 1,
      ),
      () async {
        await navigateToHomeView();
      },
    );
  }

  Future navigateToHomeView() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.homeViewRoute);
  }
}