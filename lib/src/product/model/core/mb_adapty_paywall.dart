import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:equatable/equatable.dart';

import '../../../../mb_adapty_core.dart';

final class MBAdaptyPaywall<T extends IMBAdaptyRemoteConfig<T>,
        R extends IMBAdaptyProductConfig<R, T>> extends Equatable
    with EquatableMixin {
  /// An identifier of a paywall, configured in Adapty Dashboard.
  final String placementId;

  /// A paywall name.
  final String name;

  /// Parent A/B test name.
  final String abTestName;

  /// An identifier of a variation, used to attribute purchases to this paywall.
  final String variationId;

  /// Current revision (version) of a paywall. Every change within a paywall creates a new revision.
  final int revision;

  /// If `true`, it is possible to use Adapty Paywall Builder.
  /// Read more here: https://docs.adapty.io/docs/paywall-builder-getting-started
  final bool hasViewConfiguration;

  /// And identifier of a paywall locale.
  final String locale;

  /// Custom Remote Configuration model inherited from [IMBAdaptyRemoteConfig].
  final T? remoteConfig;

  final R? productConfigs;

  MBAdaptyPaywall({
    required this.placementId,
    required this.name,
    required this.abTestName,
    required this.variationId,
    required this.revision,
    required this.hasViewConfiguration,
    required this.locale,
    this.remoteConfig,
    this.productConfigs,
  });

  factory MBAdaptyPaywall.fromAdaptyPaywall({
    required AdaptyPaywall adaptyPaywall,
    required T remoteConfigModel,
  }) {
    return MBAdaptyPaywall<T, R>(
      placementId: adaptyPaywall.placementId,
      name: adaptyPaywall.name,
      abTestName: adaptyPaywall.abTestName,
      variationId: adaptyPaywall.variationId,
      revision: adaptyPaywall.revision,
      hasViewConfiguration: adaptyPaywall.hasViewConfiguration,
      locale: adaptyPaywall.locale,
      remoteConfig: remoteConfigModel.fromJson(adaptyPaywall.remoteConfig),
    );
  }

  MBAdaptyPaywall<T, R> getWithProductConfigs({
    required List<AdaptyPaywallProduct> products,
  }) {
    return copyWith(
      productConfigs: productConfigs?.fromConfigs(
        remoteConfig: remoteConfig,
        adaptyProducts: products,
      ),
    );
  }

  @override
  List<Object?> get props => [
        placementId,
        name,
        abTestName,
        variationId,
        revision,
        hasViewConfiguration,
        locale,
        remoteConfig,
        productConfigs,
      ];

  MBAdaptyPaywall<T, R> copyWith({
    String? placementId,
    String? name,
    String? abTestName,
    String? variationId,
    int? revision,
    bool? hasViewConfiguration,
    String? locale,
    T? remoteConfig,
    R? productConfigs,
  }) {
    return MBAdaptyPaywall<T, R>(
      placementId: placementId ?? this.placementId,
      name: name ?? this.name,
      abTestName: abTestName ?? this.abTestName,
      variationId: variationId ?? this.variationId,
      revision: revision ?? this.revision,
      hasViewConfiguration: hasViewConfiguration ?? this.hasViewConfiguration,
      locale: locale ?? this.locale,
      remoteConfig: remoteConfig ?? this.remoteConfig,
      productConfigs: productConfigs ?? this.productConfigs,
    );
  }
}
