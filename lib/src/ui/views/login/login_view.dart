import 'package:compound/src/ui/global/ui_helpers.dart';
import 'package:compound/src/ui/views/login/login_viewmodel.dart';
import 'package:compound/src/ui/widgets/dumb/busy_overlay.dart';
import 'package:compound/src/ui/widgets/dumb/input_field.dart';
import 'package:compound/src/ui/widgets/dumb/rounded_button.dart';
import 'package:compound/src/ui/widgets/dumb/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget child,
      ) {
        return BusyOverlay(
          show: model.isBusy,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: blockSizeHorizontal(context) * 5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: blockSizeHorizontal(context) * 35,
                      child: Image.asset(
                        'assets/images/title.png',
                      ),
                    ),
                    InputField(
                      placeholder: 'Email',
                      controller: emailController,
                    ),
                    verticalSpaceSmall(context),
                    InputField(
                      placeholder: 'Password',
                      password: true,
                      controller: passwordController,
                    ),
                    verticalSpaceMedium(context),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundedButton(
                          text: 'Login',
                          onPressed: () async {
                            await model.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                          fontSize: blockSizeHorizontal(context) * 5,
                        ),
                      ],
                    ),
                    verticalSpaceMedium(context),
                    TextLink(
                      'Create an Account if you\'re new.',
                      onPressed: () {
                        // TODO: Handle navigation
                      },
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
