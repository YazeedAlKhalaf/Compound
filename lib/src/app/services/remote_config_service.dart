import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

const String _ShowMainBanner = "show_main_banner";

@singleton
class RemoteConfigService {
  final RemoteConfig _remoteConfig;
  final defaults = <String, dynamic>{
    _ShowMainBanner: false,
  };

  static RemoteConfigService _instance;
  @factoryMethod
  @preResolve
  static Future<RemoteConfigService> getInstance() async {
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: await RemoteConfig.instance,
      );
    }

    return _instance;
  }

  RemoteConfigService({RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  bool get showMainBanner => _remoteConfig.getBool(_ShowMainBanner);

  Future initialize() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _fetchAndActivate();
    } on FetchThrottledException catch (e) {
      print('Remote Config fetch throttles: $e');
    } catch (e) {
      print(
          'Unable to fetch remote config. Cached or default values will be used.');
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.fetch(
      expiration: Duration(seconds: 60),
    );
    await _remoteConfig.activateFetched();
  }
}
