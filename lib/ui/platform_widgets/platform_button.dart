import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_progress_indicator.dart';
import 'platform_widget.dart';

class PlatformButton extends PlatformWidget<Widget, Widget> {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isSecondary;
  final Color color;
  final Color textColor;
  final Widget child;
  final EdgeInsetsGeometry padding;

  PlatformButton({
    @required this.onPressed,
    this.text,
    this.isLoading = false,
    this.isSecondary = false,
    this.color,
    this.textColor,
    this.child,
    this.padding,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      disabledColor: Color(0xFFDDDDDD),
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
      color: isSecondary ? Colors.transparent : color,
      elevation: isSecondary ? 0.0 : null,
      child: isLoading
          ? Container(
              width: 18.0,
              height: 18.0,
              child: PlatformProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            )
          : child == null
              ? Text(
                  text?.toUpperCase() ?? '',
                  style: TextStyle(color: textColor ?? Colors.white),
                )
              : child,
      onPressed: onPressed,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return CupertinoButton(
      disabledColor: Color(0xFFDDDDDD),
      color: isSecondary ? Colors.transparent : color,
      child: isLoading
          ? Container(
              width: 18.0,
              height: 18.0,
              child: PlatformProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            )
          : child == null
              ? Text(
                  text?.toUpperCase() ?? '',
                  style: TextStyle(color: textColor ?? Colors.white),
                )
              : child,
      onPressed: onPressed,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
    );
  }
}
