import 'dart:async';

import 'package:app/app/settings/application_assets.dart';
import 'package:app/blocs/splash_bloc.dart';
import 'package:app/di/injector.dart';
import 'package:app/ui/home_page.dart';
import 'package:app/ui/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  bool active = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      bloc.getLocalDataUser().then((value) {
        if (value != null) {
          bloc.refreshToken().then((value) {
            if (value) {
              print("dato ->" + value.toString());
              goToHome();
            } else {
              print("dato ->" + value.toString());
              goToLogin();
            }
          });
        } else {
          print("dato -> usuario Nuevo");
          goToLogin();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ApplicationAssets.logoSicom),
      ),
    );
  }

  @override
  getBlocInstance() {
    return SplashBloc(Injector().provideSecurityUseCase());
  }

  void goToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  void goToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
}
