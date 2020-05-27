import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future setUserProperties({@required String userId}) async {
    await _analytics.setUserId(userId);
  }

  Future<void> logLogin() async {
    await _analytics.logLogin(
      loginMethod: 'email',
    );
  }

  Future<void> logSignUp() async {
    await _analytics.logSignUp(
      signUpMethod: 'email',
    );
  }

  Future logPostCreated({bool hasImage}) async {
    await _analytics.logEvent(
      name: 'create_post',
      parameters: {
        'has_image': hasImage,
      },
    );
  }
}
