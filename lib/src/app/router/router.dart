import 'package:auto_route/auto_route_annotations.dart';
import 'package:compound/src/ui/views/create_post/create_post_view.dart';
import 'package:compound/src/ui/views/home/home_view.dart';
import 'package:compound/src/ui/views/login/login_view.dart';
import 'package:compound/src/ui/views/signup/signup_view.dart';
import 'package:compound/src/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: CreatePostView),
  ],
)
class $Router {}
