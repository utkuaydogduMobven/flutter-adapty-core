import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:mb_adapty_core/src/core/adapty_core/i_mb_adapty_core.dart';
import 'package:mb_adapty_core/src/product/model/core/mb_adapty_profile.dart';

import '../exception/mb_adapty_exception.dart';

final class MBAdaptyCore extends IMBAdaptyCore {
  MBAdaptyCore._();
  static final MBAdaptyCore instance = MBAdaptyCore._();
  factory MBAdaptyCore() => instance;
  @override
  Future<void> activate() async {
    try {
      adapty.activate();
    } on Error catch (e) {
      throw AdaptyActivationError(e.toString(), stackTrace: e.stackTrace);
    }
  }

  @override
  Future<MBAdaptyProfile> getAdaptyProfile() async {
    try {
      return MBAdaptyProfile.fromAdaptyProfile(await adapty.getProfile());
    } on Error catch (e) {
      throw AdaptyGetProfileError(e.toString(), stackTrace: e.stackTrace);
    }
  }

  @override
  Future<MBAdaptyProfile> makePurchase({
    required AdaptyPaywallProduct product,
    AdaptyAndroidSubscriptionUpdateParameters? params,
    bool? isOfferPersonalized,
  }) async {
    try {
      AdaptyProfile? purchasedProfile = await adapty.makePurchase(
        product: product,
        subscriptionUpdateParams: params,
        isOfferPersonalized: isOfferPersonalized,
      );
      if (purchasedProfile == null) {
        throw AdaptyMakePurchaseError('Purchased profile is null');
      }
      return MBAdaptyProfile.fromAdaptyProfile(purchasedProfile);
    } on AdaptyError catch (e) {
      throw AdaptyMakePurchaseError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<MBAdaptyProfile> restorePurchases() async {
    try {
      AdaptyProfile restoredProfile = await adapty.restorePurchases();
      return MBAdaptyProfile.fromAdaptyProfile(restoredProfile);
    } on AdaptyError catch (e) {
      throw AdaptyRestorePurchasesError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> identify(String customerUserId) async {
    try {
      await adapty.identify(customerUserId);
    } on AdaptyError catch (e) {
      throw AdaptyIdentifyError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await adapty.logout();
    } on AdaptyError catch (e) {
      throw AdaptyLogoutError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AdaptyPaywall> getPaywall({
    required String placementId,
    String? locale,
    AdaptyPaywallFetchPolicy? fetchPolicy,
    Duration? loadTimeout,
  }) async {
    try {
      return await adapty.getPaywall(
        placementId: placementId,
        locale: locale,
        fetchPolicy: fetchPolicy,
        loadTimeout: loadTimeout,
      );
    } on AdaptyError catch (e) {
      throw AdaptyGetPaywallsError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<AdaptyPaywallProduct>> getPaywallProducts({
    required AdaptyPaywall paywall,
  }) async {
    try {
      return await adapty.getPaywallProducts(paywall: paywall);
    } on AdaptyError catch (e) {
      throw AdaptyGetPaywallProductsError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logShowPaywall({required AdaptyPaywall paywall}) async {
    try {
      await adapty.logShowPaywall(paywall: paywall);
    } on AdaptyError catch (e) {
      throw AdaptyGetPaywallsError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logShowOnboarding({
    String? name,
    String? screenName,
    required int screenOrder,
  }) async {
    try {
      await adapty.logShowOnboarding(
        name: name,
        screenName: screenName,
        screenOrder: screenOrder,
      );
    } on AdaptyError catch (e) {
      throw AdaptyGetPaywallsError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateProfile({required AdaptyProfileParameters params}) async {
    try {
      await adapty.updateProfile(params);
    } on AdaptyError catch (e) {
      throw AdaptyUpdateProfileError(e.toString());
    } on Error catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, AdaptyEligibility>>
      getProductsIntroductoryOfferEligibility(
          {required List<AdaptyPaywallProduct> products}) {
    // TODO: implement getProductsIntroductoryOfferEligibility
    throw UnimplementedError();
  }

  @override
  Future<void> presentCodeRedemptionSheet() {
    // TODO: implement presentCodeRedemptionSheet
    throw UnimplementedError();
  }

  @override
  Future<void> setFallbackPaywalls(String paywalls) {
    // TODO: implement setFallbackPaywalls
    throw UnimplementedError();
  }

  @override
  Future<void> setLogLevel({required AdaptyLogLevel logLevel}) {
    // TODO: implement setLogLevel
    throw UnimplementedError();
  }

  @override
  Future<void> setVariationId(
      {required String transactionId, required String variationId}) {
    // TODO: implement setVariationId
    throw UnimplementedError();
  }

  @override
  Future<void> updateAttribution(Map attribution,
      {required AdaptyAttributionSource source, String? networkUserId}) {
    // TODO: implement updateAttribution
    throw UnimplementedError();
  }
}
