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
          child: Scaffold(
            body: Center(
              child: Text(
                'Home View',
              ),
            ),
          ),
        );
      },
    );
  }
}
