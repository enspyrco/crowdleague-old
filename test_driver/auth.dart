import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdleague/models/app/app_state.dart';
import 'package:crowdleague/reducers/app_reducer.dart';
import 'package:crowdleague/utils/redux/redux_bundle.dart';
import 'package:crowdleague/utils/redux/store_operation.dart';
import 'package:crowdleague/widgets/app/crowd_league_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

import 'mocks/services_bundle_mocks.dart';
import 'mocks/wrappers/firebase_wrapper_mocks.dart';

void main() {
  enableFlutterDriverExtension();

  // Create the rdt middleware that connects to the rdt server.
  final _rdtMiddleware = RemoteDevToolsMiddleware<AppState>('localhost:8000');

  // Create an operation for the services bundle to run on the store.
  final _rdtOperation = StoreOperation((store) async {
    _rdtMiddleware.store = store; // give middleware access to the store
    await _rdtMiddleware.connect();
  });

  // Settings to make the firestore package use the local emulator
  final _firestoreSettings = Settings(
      host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);

  // Setup the services bundle to use a different bucket and with an extra
  // middleware that sends each action and state to the rdt server for display.
  ReduxBundle.setup(
      bucketName: 'gs://profile-pics-prototyping',
      extraMiddlewares: [_rdtMiddleware],
      storeOperations: [_rdtOperation],
      firestoreSettings: _firestoreSettings);

  // create a fake(ish) a services bundle
  final reduxCompleter = Completer<Store<AppState>>();
  final redux = FakeReduxBundle(completer: reduxCompleter);

  // create a fake firebase wrapper with a supplied completer
  final firebaseCompleter = Completer<FirebaseApp>();
  final firebase = FakeFirebaseWrapper(completer: firebaseCompleter);

  final store = Store<AppState>(appReducer, initialState: AppState.init());

  // complete the firebase future and verfiy text has changed as expected
  firebaseCompleter.complete();
  // complete the redux completer and verify
  reduxCompleter.complete(store);

  runApp(CrowdLeagueApp(firebase: firebase, redux: redux));
}
