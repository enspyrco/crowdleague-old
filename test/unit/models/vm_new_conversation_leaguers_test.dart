import 'dart:convert';

import 'package:crowdleague/models/conversations/vm_new_conversation_leaguers.dart';
import 'package:crowdleague/models/enums/new_conversation_page_leaguers_state.dart';
import 'package:crowdleague/models/leaguers/leaguer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ///
  /// -- Non-nullable
  ///
  /// NewConversationPageState get state;
  ///
  /// -- nullable
  ///
  /// BuiltList<Leaguer> get leaguers;
  ///

  group('VmNewConversationLeaguers', () {
    test('toJson produces correct json string', () {
      final leaguer1 = Leaguer((b) => b
        ..id = '1'
        ..name = 'Andrea Jonus'
        ..photoUrl =
            'https://lh3.googleusercontent.com/a-/AOh14GgpUMMFMDDMSfOSCUunGMkJdJ5TPkmbrU-cQEo6yZk=s96-c');

      final leaguer2 = Leaguer((b) => b
        ..id = '2'
        ..name = 'Nick Meinhold'
        ..photoUrl =
            'https://lh3.googleusercontent.com/a-/AOh14GjI7gPhw0micPDoMr3PWmsRzksx0kc-z47wMKCpJQ=s96-c');

      final leaguer3 = Leaguer((b) => b
        ..id = '3'
        ..name = 'David Micallef'
        ..photoUrl =
            'https://lh3.googleusercontent.com/a-/AOh14GgcLuTiYf_wdIIMAw5CPaBDQowtVTHczbRV8eZrIQ=s96-c');

      final vm = VmNewConversationLeaguers((b) => b
        ..state = NewConversationPageLeaguersState.ready
        ..leaguers.addAll([leaguer1, leaguer2, leaguer3]));

      print(json.encode(vm.toJson()));

      final vm2 = VmNewConversationLeaguers.fromJson(json.encode(vm.toJson()));

      expect(vm, vm2);
    });
  });
}
