import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:mb_adapty_core/mb_adapty_core.dart';

final class MBAdaptyGateService {
  MBAdaptyGateService({required IMBAdaptyCore adaptyCore})
      : _adaptyCore = adaptyCore;

  late final IMBAdaptyCore _adaptyCore;

  Future<void> activate() async => await _adaptyCore.activate();

  Future<void> identify(String customerUserId) async =>
      await _adaptyCore.identify(customerUserId);

  Future<void> logout() async => await _adaptyCore.logout();

  Future<MBAdaptyProfile> getAdaptyProfile() async =>
      _adaptyCore.getAdaptyProfile();

  Future<MBAdaptyProfile> restorePurchases() async =>
      await _adaptyCore.restorePurchases();

  Future<MBAdaptyPaywall<T, R>> getPaywall<T extends IMBAdaptyRemoteConfig<T>,
      R extends IMBAdaptyProductConfig<R, T>>({
    required String placementId,
    required T remoteConfigModel,
    bool withProductConfigs = false,
    String? locale,
    AdaptyPaywallFetchPolicy? fetchPolicy,
    Duration? loadTimeout,
  }) async {
    try {
      AdaptyPaywall adaptyPaywall = await _adaptyCore.getPaywall(
        placementId: placementId,
        locale: locale,
        fetchPolicy: fetchPolicy,
        loadTimeout: loadTimeout,
      );
      MBAdaptyPaywall<T, R> mbPaywall = MBAdaptyPaywall<T, R>.fromAdaptyPaywall(
        adaptyPaywall: adaptyPaywall,
        remoteConfigModel: remoteConfigModel,
      );
      if (withProductConfigs) {
        List<AdaptyPaywallProduct> products = await getPaywallProducts(
          paywall: mbPaywall,
        );
        return mbPaywall.getWithProductConfigs(products: products);
      }

      return mbPaywall;
    } on Error {
      rethrow;
    }
  }

  Future<Map<String, MBAdaptyPaywall<T, R>>> getPaywallsByPlacements<
      T extends IMBAdaptyRemoteConfig<T>,
      R extends IMBAdaptyProductConfig<R, T>>({
    required List<String> placementIds,
    required T remoteConfigModel,
    bool withProductConfigs = false,
    String? locale,
    AdaptyPaywallFetchPolicy? fetchPolicy,
    Duration? loadTimeout,
  }) async {
    Map<String, MBAdaptyPaywall<T, R>> paywalls = {};
    try {
      for (int i = 0; i < placementIds.length - 1;) {
        MBAdaptyPaywall<T, R> paywall = await getPaywall<T, R>(
          placementId: placementIds[i],
          remoteConfigModel: remoteConfigModel,
          locale: locale,
          fetchPolicy: fetchPolicy,
          loadTimeout: loadTimeout,
          withProductConfigs: withProductConfigs,
        );
        paywalls.addEntries([
          MapEntry(
            placementIds[i],
            paywall,
          ),
        ]);
      }
    } on Error {
      rethrow;
    }
    return paywalls;
  }

  Future<MBAdaptyProfile> makePurchase({
    required AdaptyPaywallProduct product,
    AdaptyAndroidSubscriptionUpdateParameters? params,
    bool? isOfferPersonalized,
  }) async =>
      await _adaptyCore.makePurchase(
        product: product,
        params: params,
        isOfferPersonalized: isOfferPersonalized,
      );

  Future<List<AdaptyPaywallProduct>> getPaywallProducts({
    required MBAdaptyPaywall paywall,
  }) async =>
      await _adaptyCore.getPaywallProducts(paywall: paywall.adaptyPaywall);

  Future<void> logShowOnboarding({
    String? name,
    String? screenName,
    required int screenOrder,
  }) async =>
      await _adaptyCore.logShowOnboarding(
        name: name,
        screenName: screenName,
        screenOrder: screenOrder,
      );

  Future<void> logShowPaywall({required MBAdaptyPaywall paywall}) async =>
      await _adaptyCore.logShowPaywall(paywall: paywall.adaptyPaywall);
}
