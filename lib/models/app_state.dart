library app_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/models/problem.dart';
import 'package:crowdleague/models/user.dart';
import 'package:crowdleague/models/serializers.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Problem> get problems;
  int get authStep;
  int get themeMode;
  int get navIndex;
  @nullable
  User get user;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..problems = ListBuilder<Problem>()
    ..authStep = 0
    ..navIndex = 0
    ..themeMode = 2);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
