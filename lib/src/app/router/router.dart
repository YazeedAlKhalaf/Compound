import 'package:auto_route/auto_route_annotations.dart';
import 'package:compound/src/ui/views/home/home_view.dart';
import 'package:compound/src/ui/views/login/login_view.dart';
import 'package:compound/src/ui/views/signup/signup_view.dart';
import 'package:compound/src/ui/views/startup/startup_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
  HomeView homeViewRoute;
  LoginView loginViewRoute;
  SignUpView signUpViewRoute;
}
