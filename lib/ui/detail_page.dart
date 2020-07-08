import 'package:app/blocs/list_detail_bloc.dart';
import 'package:app/ui/buyer_page.dart';
import 'package:app/ui/order_page.dart';
import 'package:app/ui/platform_widgets/platform_detail_app_bar.dart';
import 'package:app/ui/provider_page.dart';
import 'package:app/ui/vehicle_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

class ListDetail extends StatefulWidget {
  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends BaseState<ListDetail, ListDetailBloc> {
  Map<String, Widget> tabs = {
    'Comprador': Icon(Icons.verified_user),
    'Proveedor': Icon(Icons.supervised_user_circle),
    'Pedido': Icon(Icons.shopping_cart),
    'Vehículo': Icon(Icons.directions_car),
  };

  @override
  Widget build(BuildContext context) {
    return PlatformDetailApp(
      title: Text('1234566'),
      length: tabs.length,
      tabs: tabs,
      onPressedIos: () {
        Navigator.pop(context);
      },
      pages: <Widget>[
        BuyerPage(),
        ProviderPage(),
        OrderPage(),
        VehiclePage(),
      ],
    );
  }

  @override
  ListDetailBloc getBlocInstance() {
    return ListDetailBloc();
  }
}
