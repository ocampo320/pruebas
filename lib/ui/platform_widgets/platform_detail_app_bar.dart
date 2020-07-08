import 'package:app/ui/platform_widgets/platform_app_bar.dart';
import 'package:app/ui/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDetailApp
    extends PlatformWidget<CupertinoTabScaffold, DefaultTabController>
    implements PreferredSizeWidget {
  final int length;
  final Widget leading;
  final Widget title;
  final PreferredSizeWidget androidBottom;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final Widget bottom;
  final Widget tabBar;
  final Widget appBar;
  final Map<String, Widget> tabs;
  final List<Widget> pages;
  final GestureTapCallback onPressedIos;

  PlatformDetailApp({
    this.length,
    this.leading,
    this.title,
    this.androidBottom,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.tabBar,
    this.appBar,
    this.tabs,
    this.pages,
    this.onPressedIos,
  });

  @override
  DefaultTabController createAndroidWidget(BuildContext context) {
    List<Tab> androidTabs = [];
    tabs.forEach((key, value) {
      androidTabs.add(
        Tab(
          icon: value,
          text: key,
        ),
      );
    });

    return DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: PlatformAppBar(
          title: title,
          bottom: TabBar(
            tabs: androidTabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }

  @override
  CupertinoTabScaffold createIosWidget(BuildContext context) {
    List<BottomNavigationBarItem> iosTabs = [];
    tabs.forEach((key, value) {
      iosTabs.add(
        BottomNavigationBarItem(
          icon: value,
          title: Text(key),
        ),
      );
    });

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: iosTabs,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: title,
                leading: GestureDetector(
                  onTap: onPressedIos,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                  ),
                ),
              ),
              child: Center(child: pages[index]),
            );
          },
        );
      },
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
