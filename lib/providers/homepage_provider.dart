import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homepage_provider.g.dart';

@riverpod
class BottomBar extends _$BottomBar {
  Color _color = Colors.transparent;
  @override
  Color build() {
    return _color;
  }

  void makeTransparent() {
    _color = Colors.transparent;
    state = _color;
  }

  void makeSurface(Color color) {
    _color = color;
    state = _color;
  }
}
