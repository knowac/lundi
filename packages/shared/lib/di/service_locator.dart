import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceLocator {
  static final _providers = <Type, ProviderBase<dynamic>>{};

  static void register<T>(ProviderBase<T> provider) {
    _providers[T] = provider;
  }

  static ProviderBase<T> get<T>() {
    final provider = _providers[T];
    if (provider == null) {
      throw Exception('Provider not found for type $T');
    }
    return provider as ProviderBase<T>;
  }

  static bool isRegistered<T>() => _providers.containsKey(T);
  static void clear() => _providers.clear();
}
