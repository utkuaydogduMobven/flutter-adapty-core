abstract class AdaptyException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AdaptyException(this.message, {this.stackTrace});

  @override
  String toString() {
    return 'AdaptyException: $message';
  }
}

final class AdaptyActivationError extends AdaptyException {
  AdaptyActivationError(super.message, {super.stackTrace});
}

final class AdaptyGetProfileError extends AdaptyException {
  AdaptyGetProfileError(super.message, {super.stackTrace});
}

final class AdaptyMakePurchaseError extends AdaptyException {
  AdaptyMakePurchaseError(super.message, {super.stackTrace});
}

final class AdaptyRestorePurchasesError extends AdaptyException {
  AdaptyRestorePurchasesError(super.message, {super.stackTrace});
}

final class AdaptyValidateReceiptError extends AdaptyException {
  AdaptyValidateReceiptError(super.message, {super.stackTrace});
}

final class AdaptyUpdateAttributionError extends AdaptyException {
  AdaptyUpdateAttributionError(super.message, {super.stackTrace});
}

final class AdaptyIdentifyError extends AdaptyException {
  AdaptyIdentifyError(String message, {StackTrace? stackTrace})
      : super("[AdaptyIdentifyError]: $message", stackTrace: stackTrace);
}

final class AdaptyLogoutError extends AdaptyException {
  AdaptyLogoutError(String message, {StackTrace? stackTrace})
      : super("[AdaptyLogoutError]: $message", stackTrace: stackTrace);
}

final class AdaptyGetPromoError extends AdaptyException {
  AdaptyGetPromoError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetPromoError]: $message", stackTrace: stackTrace);
}

final class AdaptyUpdateProfileError extends AdaptyException {
  AdaptyUpdateProfileError(String message, {StackTrace? stackTrace})
      : super("[AdaptyUpdateProfileError]: $message", stackTrace: stackTrace);
}

final class AdaptyGetPaywallsError extends AdaptyException {
  AdaptyGetPaywallsError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetPaywallsError]: $message", stackTrace: stackTrace);
}

final class AdaptyGetPaywallProductsError extends AdaptyException {
  AdaptyGetPaywallProductsError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetPaywallProductsError]: $message",
            stackTrace: stackTrace);
}

final class AdaptyGetProductsError extends AdaptyException {
  AdaptyGetProductsError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetProductsError]: $message", stackTrace: stackTrace);
}

final class AdaptyGetPurchaserInfoError extends AdaptyException {
  AdaptyGetPurchaserInfoError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetPurchaserInfoError]: $message",
            stackTrace: stackTrace);
}

final class AdaptyValidateAppleReceiptError extends AdaptyException {
  AdaptyValidateAppleReceiptError(String message, {StackTrace? stackTrace})
      : super("[AdaptyValidateAppleReceiptError]: $message",
            stackTrace: stackTrace);
}

final class AdaptyValidateGoogleReceiptError extends AdaptyException {
  AdaptyValidateGoogleReceiptError(String message, {StackTrace? stackTrace})
      : super("[AdaptyValidateGoogleReceiptError]: $message",
            stackTrace: stackTrace);
}

final class AdaptyValidateHuaweiReceiptError extends AdaptyException {
  AdaptyValidateHuaweiReceiptError(String message, {StackTrace? stackTrace})
      : super("[AdaptyValidateHuaweiReceiptError]: $message",
            stackTrace: stackTrace);
}

final class AdaptyValidateWebhookError extends AdaptyException {
  AdaptyValidateWebhookError(String message, {StackTrace? stackTrace})
      : super("[AdaptyValidateWebhookError]: $message", stackTrace: stackTrace);
}

final class AdaptyGetPromoPaywallsError extends AdaptyException {
  AdaptyGetPromoPaywallsError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetPromoPaywallsError]: $message",
            stackTrace: stackTrace);
}

final class AdaptyGetContainerError extends AdaptyException {
  AdaptyGetContainerError(String message, {StackTrace? stackTrace})
      : super("[AdaptyGetContainerError]: $message", stackTrace: stackTrace);
}
