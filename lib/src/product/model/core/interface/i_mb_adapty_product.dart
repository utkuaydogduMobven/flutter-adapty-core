import 'package:adapty_flutter/adapty_flutter.dart';

import 'i_mb_adapty_remote_config.dart';

abstract class IMBAdaptyProductConfig<T extends IMBAdaptyProductConfig<T, R>,
    R extends IMBAdaptyRemoteConfig<R>> {
  Map<String, dynamic> toJson();

  T? fromConfigs({
    required List<AdaptyPaywallProduct>? adaptyProducts,
    required R? remoteConfig,
  });
}
