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

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String createPostView = '/create-post-view';
  static const all = <String>{
    startupView,
    homeView,
    loginView,
    signUpView,
    createPostView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.createPostView, page: CreatePostView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    LoginView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    CreatePostView: (RouteData data) {
      var args = data.getArgs<CreatePostViewArguments>(
          orElse: () => CreatePostViewArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreatePostView(
            editingPost: args.editingPost, newPost: args.newPost),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//CreatePostView arguments holder class
class CreatePostViewArguments {
  final Post editingPost;
  final Post newPost;
  CreatePostViewArguments({this.editingPost, this.newPost});
}
