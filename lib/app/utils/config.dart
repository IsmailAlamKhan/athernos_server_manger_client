import 'package:hooks_riverpod/hooks_riverpod.dart';

final configProvider = Provider<Config>((ref) {
  return DevConfig();
  // if (kDebugMode) {
  //   return DevConfig();
  // } else {
  //   return ProdConfig();
  // }
});

abstract class Config {
  final String url;

  Config(this.url);
}

class DevConfig extends Config {
  DevConfig() : super('http://192.168.0.131:8000');
}

class ProdConfig extends Config {
  ProdConfig() : super('http://prod.example.com');
}
