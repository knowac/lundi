import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

interface class X {}

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
