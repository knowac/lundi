import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_cleared_provider.g.dart';

@Riverpod(keepAlive: true)
class DataCleared extends _$DataCleared {
  @override
  int build() => 0;

  void notify() {
    state++;
  }
}
