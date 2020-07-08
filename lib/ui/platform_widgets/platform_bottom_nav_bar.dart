import 'package:app/ui/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformBottomNavBar
    extends PlatformWidget<CupertinoTabBar, BottomNavigationBar> {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color selectedItemColor;

  PlatformBottomNavBar({
    this.items,
    this.currentIndex,
    this.onTap,
    this.selectedItemColor,
  });

  @override
  BottomNavigationBar createAndroidWidget(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
    );
  }

  @override
  CupertinoTabBar createIosWidget(BuildContext context) {
    return CupertinoTabBar(
      items: items,
      onTap: onTap,
      currentIndex: currentIndex,
      activeColor: selectedItemColor,
      backgroundColor: Colors.transparent,
    );
  }
}
