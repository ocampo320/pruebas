import 'package:app/app/settings/application_assets.dart';
import 'package:app/blocs/login_bloc.dart';
import 'package:app/di/injector.dart';
import 'package:app/ui/platform_widgets/platform_button.dart';
import 'package:app/ui/platform_widgets/platform_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:models/authentication_request.dart';
import 'package:models/result.dart';
import 'package:url_launcher/url_launcher.dart';

import 'base_state.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginBloc> {
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isTextPasswordObscure = true;

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var widgetsWidth = screenWidth * 0.8;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Center(
              child: Image.asset(ApplicationAssets.logoSicom),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Text(l10n.signInText,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  width: widgetsWidth,
                  child: PlatformTextField(
                    controller: _userController,
                    labelText: l10n.user,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_passwordNode);
                    },
                    onChanged: (value) {
                      bloc.userSink.add(value);
                    },
                    inputFormatters: [
                      BlacklistingTextInputFormatter(
                        RegExp("[ ]"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: Container(
                  width: widgetsWidth,
                  child: StreamBuilder<bool>(
                    initialData: true,
                    stream: bloc.emptyFields,
                    builder: (context, emptyFieldsSnapshot) {
                      return PlatformTextField(
                        controller: _passwordController,
                        focusNode: _passwordNode,
                        labelText: l10n.password,
                        textInputAction: TextInputAction.done,
                        obscureText: isTextPasswordObscure,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isTextPasswordObscure = !isTextPasswordObscure;
                            });
                          },
                          icon: isTextPasswordObscure
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        onChanged: (value) {
                          bloc.passwordSink.add(value);
                        },
                        onSubmitted: (_) {},
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: StreamBuilder<bool>(
                initialData: true,
                stream: bloc.emptyFields,
                builder: (context, emptyFieldsSnapshot) {
                  return StreamBuilder<bool>(
                      initialData: false,
                      stream: bloc.loading,
                      builder: (context, loadingSnapshot) {
                        return PlatformButton(
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          isLoading: loadingSnapshot.data,
                          text: l10n.signInText,
                          onPressed: () {
                            onPressed:
                            // ignore: unnecessary_statements
                            emptyFieldsSnapshot.data ? null : _login();
                          },
                        );
                      });
                },
              ),
            ),
            Center(
              child: Container(
                width: widgetsWidth,
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        if (await canLaunch(l10n.urlSicom)) {
                          await launch(l10n.urlSicom);
                        }
                      },
                      child: Text(l10n.forgotUserNameQuestion),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Image.asset(ApplicationAssets.logoMinEnergia),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _login() {
    if (bloc.loading.value ?? false) {
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    var user = _userController.text.trim();
    var password = _passwordController.text.trim();
    var authenticationRequest =
        AuthenticationRequest(user: user, password: password);
    bloc.login(authenticationRequest).then((result) {
      if (result.status == Status.success) {
        if (result.data.userState == 'active') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
            (route) => false,
          );
        } else {
          _showAlertSignInFailed(message: l10n.errorTitleCustomAlert);
        }
      } else {
        showDefaultAlert(message: l10n.errorTitleCustomAlert);
      }
    });

//    if (_passwordController.text.trim() == '123456' &&
//        _userController.text.trim() == 'deivi') {
//      return true;
//    } else {
//      return false;
//    }
  }

  void _showAlertSignInFailed({String message, bool isUserLocked}) {
    showCustomAlert(
      title: l10n.authWrongCredentialsError,
      icon: Icons.error_outline,
      color: Colors.red,
      message: message,
      positiveTextButton: (isUserLocked ?? false) ? l10n.unlock : l10n.accept,
      positiveOnPressed: () {
        (isUserLocked ?? false) ? Text("error") : Navigator.of(context).pop();
      },
    );
  }

  @override
  getBlocInstance() => LoginBloc(Injector().provideSecurityUseCase());
}
