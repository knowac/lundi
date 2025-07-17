import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/interfaces/abstract_auth_repository.dart';

part 'auth_repository.g.dart';

@riverpod
AbstractAuthRepository sharedAuthRepository(Ref ref) =>
    throw UnimplementedError();
