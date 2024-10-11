import 'package:adapty_flutter/src/models/adapty_paywall_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mb_adapty_core/mb_adapty_core.dart';
import 'package:mb_adapty_core/src/product/model/remote_config/mb_remote_config.dart';

final class MockMBProductConfig<T, R>
    extends IMBAdaptyProductConfig<MockMBProductConfig<T, R>, MBRemoteConfig> {
  final String _name = "";

  String get name => _name;

  @override
  MockMBProductConfig<T, R>? fromConfigs({
    required List<AdaptyPaywallProduct>? adaptyProducts,
    required MBRemoteConfig? remoteConfig,
  }) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

void main() {
  late MBAdaptyGateService adaptyGateService;
  late List<String> placementIds;
  late MBRemoteConfig remoteConfigModel;

  setUp(() async {
    adaptyGateService = MBAdaptyGateService(adaptyCore: MBAdaptyCore.instance);
    placementIds = ['placement1', 'placement2'];
    remoteConfigModel = MBRemoteConfig();
    await adaptyGateService.activate();
  });

  test('Get Paywalls with products', () async {
    final paywalls = await adaptyGateService.getPaywallsByPlacements<
        MBRemoteConfig,
        MockMBProductConfig<MockMBProductConfig, MBRemoteConfig>>(
      placementIds: placementIds,
      remoteConfigModel: remoteConfigModel,
      withProductConfigs: true,
    );
    paywalls.forEach((key, paywall) {
      paywall.productConfigs?.name;
    });
  });
}
