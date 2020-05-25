import 'package:compound/src/ui/global/ui_helpers.dart';
import 'package:compound/src/ui/views/signup/signup_viewmodel.dart';
import 'package:compound/src/ui/widgets/dumb/busy_overlay.dart';
import 'package:compound/src/ui/widgets/dumb/input_field.dart';
import 'package:compound/src/ui/widgets/dumb/rounded_button.dart';
import 'package:compound/src/ui/widgets/dumb/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (
        BuildContext context,
        SignUpViewModel model,
        Widget child,
      ) {
        return BusyOverlay(
          show: model.isBusy,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: blockSizeHorizontal(context) * 5,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: blockSizeHorizontal(context) * 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpaceLarge(context),
                      InputField(
                        placeholder: 'Full name',
                        controller: fullNameController,
                      ),
                      verticalSpaceSmall(context),
                      InputField(
                        placeholder: 'Email',
                        controller: emailController,
                      ),
                      verticalSpaceSmall(context),
                      InputField(
                        placeholder: 'Password',
                        password: true,
                        controller: passwordController,
                        additionalNote:
                            'Password has to be a minimum of 6 characters.',
                      ),
                      verticalSpaceMedium(context),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RoundedButton(
                            isBusy: model.isBusy,
                            text: 'Sign Up',
                            onPressed: () async {
                              await model.signUp(
                                fullName: fullNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              ;
                            },
                            fontSize: blockSizeHorizontal(context) * 5,
                          ),
                        ],
                      ),
                      verticalSpaceMedium(context),
                      TextLink(
                        'Already Have An Account? Login Now!',
                        onPressed: () async {
                          await model.navigateToLoginView();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
