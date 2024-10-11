import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:mb_adapty_core/src/core/extension/list_ext.dart';

extension AdaptyAccessLevelExt on Map<String, AdaptyAccessLevel> {
  bool get hasActiveAccessLevel => values.any((element) => element.isActive);

  bool get hasNonActiveAccessLevel =>
      values.any((element) => !element.isActive);

  AdaptyAccessLevel? get activeAccessLevel {
    return values.firstWhereOrNull((element) => element.isActive);
  }

  bool isPremiumWithKey(String accessLevelKey) {
    final accessLevel = this[accessLevelKey];
    return accessLevel != null && accessLevel.isActive;
  }
}
