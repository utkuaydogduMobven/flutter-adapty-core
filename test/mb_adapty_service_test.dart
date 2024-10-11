/* import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mb_adapty_core/mb_adapty_core.dart';
import 'package:adapty_flutter/adapty_flutter.dart';

// Mock classes
class MockAdaptyCore extends Mock implements IMBAdaptyCore {}

class MockRemoteConfig extends Mock
    implements IMBAdaptyRemoteConfig<MockRemoteConfig> {}

class MockProduct extends Mock
    implements IMBAdaptyProduct<MockProduct, MockRemoteConfig> {}

void main() {
  late MBAdaptyGateService adaptyGateService;
  late MockAdaptyCore mockAdaptyCore;
  late MockRemoteConfig mockRemoteConfig;

  setUp(() {
    mockAdaptyCore = MockAdaptyCore();
    mockRemoteConfig = MockRemoteConfig();
    adaptyGateService = MBAdaptyGateService(adaptyCore: mockAdaptyCore);
  });

  group('getPaywallsByPlacements', () {
    test('should return a map of paywalls for given placements', () async {
      final placementIds = ['placement1', 'placement2'];
      final mockPaywall =
          MBAdaptyPaywall<MockRemoteConfig, MockProduct>.fromAdaptyPaywall(
        adaptyPaywall: AdaptyPaywall(),
        remoteConfigModel: mockRemoteConfig,
      );

      when(mockAdaptyCore.getPaywall(
        placementId: anyNamed('placementId'),
        locale: anyNamed('locale'),
        fetchPolicy: anyNamed('fetchPolicy'),
        loadTimeout: anyNamed('loadTimeout'),
      )).thenAnswer((_) async => AdaptyPaywall(id: 'paywall1', products: []));

      when(mockAdaptyCore.getPaywallProducts(paywall: anyNamed('paywall')))
          .thenAnswer((_) async => []);

      final result = await adaptyGateService.getPaywallsByPlacements(
        placementIds: placementIds,
        remoteConfigModel: mockRemoteConfig,
      );

      expect(result.length, 2);
      expect(result.containsKey('placement1'), true);
      expect(result.containsKey('placement2'), true);
    });

    test('should throw an error if getPaywall fails', () async {
      final placementIds = ['placement1'];

      when(mockAdaptyCore.getPaywall(
        placementId: anyNamed('placementId'),
        locale: anyNamed('locale'),
        fetchPolicy: anyNamed('fetchPolicy'),
        loadTimeout: anyNamed('loadTimeout'),
      )).thenThrow(Error());

      expect(
        () async => await adaptyGateService.getPaywallsByPlacements(
          placementIds: placementIds,
          remoteConfigModel: mockRemoteConfig,
        ),
        throwsA(isA<Error>()),
      );
    });
  });
}
 */