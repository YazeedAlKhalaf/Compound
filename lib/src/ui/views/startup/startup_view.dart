import 'package:compound/src/ui/global/app_colors.dart';
import 'package:compound/src/ui/global/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:compound/src/ui/views/startup/startup_viewmodel.dart';
import 'package:compound/src/ui/widgets/dumb/busy_overlay.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (StartupViewModel model) => model.handleStartup(),
      viewModelBuilder: () => StartupViewModel(),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget child,
      ) {
        return BusyOverlay(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'assets/images/icon_large.png',
                      width: blockSizeHorizontal(context) * 35,
                    ),
                  ),
                  verticalSpaceMedium(context),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
