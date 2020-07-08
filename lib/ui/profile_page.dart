import 'dart:async';

import 'package:app/app/settings/application.dart';
import 'package:app/blocs/profile_bloc.dart';
import 'package:app/blocs/provider/provider.dart';
import 'package:app/di/injector.dart';
import 'package:app/ui/login_page.dart';
import 'package:app/ui/widgets/circular_loader_pages_indicator.dart';
import 'package:flutter/material.dart';
import 'package:models/authentication_response.dart';

import 'base_state.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage, ProfileBloc> {
  @override
  StreamSubscription<bool> subscription;

  void initState() {
    super.initState();
    bloc.getDataUser();
    _listenLogout();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthenticationResponse>(
        stream: bloc.profile,
        builder: (context, snapshot) {
          return (snapshot.data != null)
              ? Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 2.13,
                            child: Expanded(
                              child: Container(
                                color: Colors.blue,
                                child: FlutterLogo(),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Text(l10n.agent),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Text(l10n.type),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Text(l10n.user),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Text(l10n.name),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child:
                                            Text(bloc.profile.value.user ?? ""),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child: Text(
                                            bloc.profile.value.sicomAgent ??
                                                ""),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child:
                                            Text(bloc.profile.value.user ?? ""),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(22.0),
                                        child:
                                            Text(bloc.profile.value.name ?? ""),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 24.0),
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(Icons.exit_to_app),
                              title: Text(l10n.logout),
                              onTap: () {
                                _listenLogout();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: CircularLoaderPageIndicator(
                      text: l10n.loadingProfile,
                    ),
                  ),
                );
        });
  }

  void _listenLogout() {
    subscription = Application().logoutStream.listen((value) {
      subscription.cancel();
      var profileBloc = Provider.of<ProfileBloc>(null);
      profileBloc.doLogOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  getBlocInstance() => ProfileBloc(Injector().provideSecurityUseCase());
}
