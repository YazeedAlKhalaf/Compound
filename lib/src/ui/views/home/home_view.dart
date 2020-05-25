import 'package:compound/src/ui/global/ui_helpers.dart';
import 'package:compound/src/ui/widgets/dumb/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:compound/src/ui/views/home/home_viewmodel.dart';
import 'package:compound/src/ui/widgets/dumb/busy_overlay.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return BusyOverlay(
          show: model.isBusy,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Home View',
                  ),
                  RoundedButton(
                    isBusy: model.isBusy,
                    text: 'Sign Out',
                    fontSize: blockSizeHorizontal(context) * 4,
                    onPressed: () async {
                      await model.signOut();
                    },
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
