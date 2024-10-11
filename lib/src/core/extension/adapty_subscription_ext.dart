import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:mb_adapty_core/src/core/extension/list_ext.dart';

extension AdaptySubscriptionExt on Map<String, AdaptySubscription> {
  bool get hasActiveSubscription => values.any((element) => element.isActive);

  bool get hasNonActiveSubscription =>
      values.any((element) => !element.isActive);

  AdaptySubscription? get activeSubscription {
    return values.firstWhereOrNull((element) => element.isActive);
  }
}
