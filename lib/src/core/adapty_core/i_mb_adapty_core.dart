import 'package:adapty_flutter/adapty_flutter.dart';

import '../../product/model/core/mb_adapty_profile.dart';

abstract class IMBAdaptyCore {
  final Adapty adapty = Adapty();

  Future<void> activate();

  Future<MBAdaptyProfile> getAdaptyProfile();

  Future<MBAdaptyProfile> makePurchase({
    required AdaptyPaywallProduct product,
    AdaptyAndroidSubscriptionUpdateParameters? params,
    bool? isOfferPersonalized,
  });

  Future<MBAdaptyProfile> restorePurchases();

  Future<void> identify(String customerUserId);

  Future<void> logout();

  Future<AdaptyPaywall> getPaywall({
    required String placementId,
    String? locale,
    AdaptyPaywallFetchPolicy? fetchPolicy,
    Duration? loadTimeout,
  });

  Future<List<AdaptyPaywallProduct>> getPaywallProducts({
    required AdaptyPaywall paywall,
  });

  Future<void> logShowPaywall({required AdaptyPaywall paywall});

  Future<void> logShowOnboarding({
    String? name,
    String? screenName,
    required int screenOrder,
  });

  Future<void> updateProfile({required AdaptyProfileParameters params});

  Future<void> setLogLevel({required AdaptyLogLevel logLevel});

  Future<Map<String, AdaptyEligibility>>
      getProductsIntroductoryOfferEligibility({
    required List<AdaptyPaywallProduct> products,
  });

  Future<void> updateAttribution(
    Map attribution, {
    required AdaptyAttributionSource source,
    String? networkUserId,
  });

  Future<void> setVariationId(
      {required String transactionId, required String variationId});

  Future<void> setFallbackPaywalls(String paywalls);

  Future<void> presentCodeRedemptionSheet();
}
