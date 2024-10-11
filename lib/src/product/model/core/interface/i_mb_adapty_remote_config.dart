abstract class IMBAdaptyRemoteConfig<T extends IMBAdaptyRemoteConfig<T>> {
  Map<String, dynamic> toJson();

  T? fromJson(Map<String, dynamic>? json);
}
