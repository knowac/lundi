import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_updated_provider.g.dart';

@Riverpod(keepAlive: true)
class DataUpdated extends _$DataUpdated {
  @override
  int build() => 0;

  void notify() {
    state++;
  }
}
