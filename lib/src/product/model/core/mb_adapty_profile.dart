import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:mb_adapty_core/src/core/extension/extension.dart';

final class MBAdaptyProfile extends Equatable with EquatableMixin {
  /// An identifier of a user in Adapty.
  final String profileId;

  /// An identifier of a user in your system.
  ///
  /// [Nullable]
  final String? customerUserId;

  /// Previously set user custom attributes with `.updateProfile()` method.
  final Map<String, dynamic> customAttributes;

  /// The keys are access level identifiers configured by you in Adapty Dashboard.
  /// The values are Can be null if the customer has no access levels.
  final Map<String, AdaptyAccessLevel> accessLevels;

  /// The keys are product ids from a store. The values are information about subscriptions.
  /// Can be null if the customer has no subscriptions.
  final Map<String, AdaptySubscription> subscriptions;

  /// The keys are product ids from the store. The values are arrays of information about consumables.
  /// Can be null if the customer has no purchases.
  final Map<String, List<AdaptyNonSubscription>> nonSubscriptions;

  MBAdaptyProfile({
    required this.profileId,
    this.customerUserId,
    this.customAttributes = const {},
    this.accessLevels = const {},
    this.subscriptions = const {},
    this.nonSubscriptions = const {},
  });

  factory MBAdaptyProfile.fromAdaptyProfile(AdaptyProfile profile) {
    return MBAdaptyProfile(
      profileId: profile.profileId,
      customerUserId: profile.customerUserId,
      customAttributes: profile.customAttributes,
      accessLevels: profile.accessLevels,
      subscriptions: profile.subscriptions,
      nonSubscriptions: profile.nonSubscriptions,
    );
  }

  bool get hasAccessLevels => accessLevels.isNotEmpty;

  bool get hasSubscriptions => subscriptions.isNotEmpty;

  bool get hasNonSubscriptions => nonSubscriptions.isNotEmpty;

  bool get hasCustomAttributes => customAttributes.isNotEmpty;

  bool get isOldSubscriber =>
      !subscriptions.values.any((element) => element.isActive);

  bool get isPremiumSubscriber => subscriptions.hasActiveSubscription;

  bool get hasActiveAccessLevel => accessLevels.hasActiveAccessLevel;

  bool get hasNonActiveAccessLevel => accessLevels.hasNonActiveAccessLevel;

  bool isPremiumWithKey(String accessLevelKey) =>
      accessLevels.isPremiumWithKey(accessLevelKey);

  AdaptySubscription? get activeSubscription =>
      subscriptions.activeSubscription;

  AdaptyAccessLevel? get activeAccessLevel => accessLevels.activeAccessLevel;

  @override
  List<Object?> get props => [
        profileId,
        customerUserId,
        customAttributes,
        accessLevels,
        subscriptions,
        nonSubscriptions,
      ];
}
