import 'dart:io' show Platform;

import 'package:app/ui/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar>
    implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final PreferredSizeWidget bottom;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;

  PlatformAppBar({
    this.leading,
    this.bottom,
    this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    Color backgroundColor,
  });

  @override
  AppBar createAndroidWidget(BuildContext context) {
    return AppBar(
      leading: leading,
      bottom: bottom,
      title: title,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: title,
      trailing: actions != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize {
    if (Platform.isAndroid) {
      return Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
    } else {
      return const Size.fromHeight(44.0);
    }
  }
}
