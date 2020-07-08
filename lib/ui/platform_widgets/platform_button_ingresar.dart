import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformButtomIngresar extends PlatformWidget<Widget, Widget> {
  final String text;
  final Color color;
  final Color textColor;
  final Widget child;
  final VoidCallback onPressed;
  final Color borderColor;

  PlatformButtomIngresar({
    @required this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.child,
    this.borderColor,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: borderColor)),
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      child: Text(text, style: TextStyle(fontSize: 14)),
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CupertinoButton.filled(
          child: Text(text),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
