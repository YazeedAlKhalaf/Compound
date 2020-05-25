// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:compound/src/ui/views/startup/startup_view.dart';
import 'package:compound/src/ui/views/home/home_view.dart';
import 'package:compound/src/ui/views/login/login_view.dart';
import 'package:compound/src/ui/views/signup/signup_view.dart';
import 'package:compound/src/ui/views/create_post/create_post_view.dart';
import 'package:compound/src/app/models/post.dart';

abstract class Routes {
  static const startupViewRoute = '/';
  static const homeViewRoute = '/home-view-route';
  static const loginViewRoute = '/login-view-route';
  static const signUpViewRoute = '/sign-up-view-route';
  static const createPostViewRoute = '/create-post-view-route';
  static const all = {
    startupViewRoute,
    homeViewRoute,
    loginViewRoute,
    signUpViewRoute,
    createPostViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startupViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartupView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case Routes.signUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case Routes.createPostViewRoute:
        if (hasInvalidArgs<CreatePostViewArguments>(args)) {
          return misTypedArgsRoute<CreatePostViewArguments>(args);
        }
        final typedArgs =
            args as CreatePostViewArguments ?? CreatePostViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              CreatePostView(editingPost: typedArgs.editingPost),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//CreatePostView arguments holder class
class CreatePostViewArguments {
  final Post editingPost;
  CreatePostViewArguments({this.editingPost});
}
