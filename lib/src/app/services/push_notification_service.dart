import 'dart:io';

import 'package:compound/src/app/router/router.gr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stacked_services/stacked_services.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final NavigationService _navigationService = NavigationService();

  Future<void> initialize() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _serializeAndNavigate(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
      },
    );
  }

  void _serializeAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      switch (view) {
        case 'create_post':
          _navigationService.navigateTo(Routes.createPostViewRoute);
          break;
        default:
      }
    }
  }
}
