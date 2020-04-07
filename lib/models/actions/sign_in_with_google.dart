library signin_with_google;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'sign_in_with_google.g.dart';

abstract class SignInWithGoogle extends Object
    with ReduxAction
    implements Built<SignInWithGoogle, SignInWithGoogleBuilder> {
  SignInWithGoogle._();

  factory SignInWithGoogle([void Function(SignInWithGoogleBuilder) updates]) =
      _$SignInWithGoogle;

  Object toJson() =>
      serializers.serializeWith(SignInWithGoogle.serializer, this);

  static SignInWithGoogle fromJson(String jsonString) => serializers
      .deserializeWith(SignInWithGoogle.serializer, json.decode(jsonString));

  static Serializer<SignInWithGoogle> get serializer =>
      _$signInWithGoogleSerializer;
}
