import 'package:app/blocs/home_bloc.dart';
import 'package:app/di/injector.dart';
import 'package:app/ui/base_state.dart';
import 'package:app/ui/list_page.dart';
import 'package:app/ui/platform_widgets/platform_bottom_nav_bar.dart';
import 'package:app/ui/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  int _selectedIndex = 1;
  List<Widget> _pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadPage();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PlatformBottomNavBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(l10n.profile),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text(l10n.list),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(93, 159, 243, 1),
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }

  void _loadPage() {
    _pages = [ProfilePage(), ListPage()];
  }

  @override
  HomeBloc getBlocInstance() {
    return HomeBloc(Injector().providePurchaseOrderUseCase());
  }
}
