import 'package:feature_auth/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_auth/auth_repository.dart';
import 'package:shared/di/interfaces/abstract_auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AbstractAuthRepository authRepository(Ref ref) => AuthRepository();

final authRepositoryProviderOverride = ProviderOverride(
  origin: sharedAuthRepositoryProvider,
  override: authRepositoryProvider,
);
