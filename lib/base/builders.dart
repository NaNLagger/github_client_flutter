import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class EffectBuilder<T> {
  Effect<T> build();
}

abstract class ReducerBuilder<T> {
  Reducer<T> build();
}

abstract class ViewBuilder<T> {
  Widget build(T state, Dispatch dispatch, ViewService viewService);
}