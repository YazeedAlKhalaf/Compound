import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/models/post.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:compound/src/app/services/authentication_service.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DynamicLinkService {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future handleDynamicLinks() async {
    // STARTUP FROM DYNAMIC LINK LOGIC
    // Get initial dynamic if the app is started using the link
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    _handleDeepLink(data);

    // INTO FOREGROUND FROM DYNAMIC LINK LOGIC
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData dynamicLinkData) async {
        _handleDeepLink(dynamicLinkData);
      },
      onError: (OnLinkErrorException error) async {
        print('Dynamic Link Failed: ${error.message}');
      },
    );
  }

  Future<String> createFirstPostLink(String title) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://compoundapp.page.link',
      link: Uri.parse(
        'https://www.compound.com/post?title=$title',
      ),
      androidParameters: AndroidParameters(
        packageName: 'dev.alkhalaf.compound',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Create First Post Dynamic Link',
        description: 'This link works whether the app is installed or not!',
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();

    return dynamicUrl.toString();
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deepLink: $deepLink');

      var isPost = deepLink.queryParameters['title'].contains('post');
      if (isPost) {
        var title = deepLink.queryParameters['title'];
        if (title != null) {
          // Navigate To Create Post View
          _navigationService.navigateTo(
            Routes.createPostViewRoute,
            arguments: CreatePostViewArguments(
              newPost: Post(
                title: title,
                userId: _authenticationService.currentUser.id,
              ),
            ),
          );
        }
      }
    }
  }
}
