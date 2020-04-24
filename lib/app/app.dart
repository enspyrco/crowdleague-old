import 'package:crowdleague/models/actions/observe_auth_state.dart';
import 'package:crowdleague/models/actions/print_fcm_token.dart';
import 'package:crowdleague/models/actions/request_fcm_permissions.dart';
import 'package:crowdleague/models/app_state.dart';
import 'package:crowdleague/models/user.dart';
import 'package:crowdleague/widgets/auth/auth_page.dart';
import 'package:crowdleague/widgets/auth/other_auth_options_page.dart';
import 'package:crowdleague/widgets/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CrowdLeagueApp extends StatefulWidget {
  CrowdLeagueApp(this.store);
  final Store<AppState> store;
  @override
  _CrowdLeagueAppState createState() => _CrowdLeagueAppState();
}

class _CrowdLeagueAppState extends State<CrowdLeagueApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(ObserveAuthState());
    widget.store.dispatch(RequestFCMPermissions());
    widget.store.dispatch(PrintFCMToken());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, int>(
          distinct: true,
          converter: (store) => store.state.themeMode,
          builder: (context, themeMode) {
            return MaterialApp(
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: (themeMode == 0)
                  ? ThemeMode.light
                  : (themeMode == 1) ? ThemeMode.dark : ThemeMode.system,
              initialRoute: '/',
              routes: {
                '/': (context) {
                  return StoreConnector<AppState, User>(
                      distinct: true,
                      converter: (store) => store.state.user,
                      builder: (context, user) {
                        return (user == null || user.uid == null)
                            ? AuthPage()
                            : MainPage();
                      });
                },
                '/other_auth_options': (context) => OtherAuthOptionsPage(),
              },
              // home:
            );
          }),
    );
  }
}
