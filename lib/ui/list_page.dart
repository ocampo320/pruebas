import 'package:app/blocs/list_bloc.dart';
import 'package:app/di/injector.dart';
import 'package:app/ui/filter_page.dart';
import 'package:app/ui/platform_widgets/platform_app_bar.dart';
import 'package:app/ui/widgets/circular_loader_pages_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/purchase_order_response.dart';

import 'base_state.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends BaseState<ListPage, ListBloc> {
  List<String> items;

  @override
  void initState() {
    super.initState();
    bloc.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PurchaseOrderResponse>(
        stream: bloc.dataList,
        builder: (context, snapshot) {
          return (snapshot.data != null)
              ? Container(
                  child: Scaffold(
                    appBar: PlatformAppBar(
                      title: Text(l10n.orders),
                      actions: <Widget>[
                        Material(
                          color: Colors.transparent,
                          child: IconButton(
                            icon: Icon(Icons.filter_list),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext) => FilterPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.0,
                              top: 16.0,
                            ),
                            child: Text(
                              l10n.orderRegisters,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.0,
                              top: 16.0,
                            ),
                            child: Column(
                              children: generateList(
                                  bloc.dataList.value.orders.length),
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
                      text: l10n.loadingOrders,
                    ),
                  ),
                );
        });
  }

  @override
  ListBloc getBlocInstance() {
    return ListBloc(Injector().providePurchaseOrderUseCase());
  }

  List<_InfoCard> generateList(int number) {
    var list = <_InfoCard>[];
    for (var i = 0; i <= number - 1; i++) {
      list.add(_InfoCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListDetail()),
          );
          print("se precionó la card");
        },
        codeSicom: bloc.dataList.value.orders[i].id,
        buyer: l10n.buyer + ": " + bloc.dataList.value.orders[i].buyer ?? " ",
        client:
            l10n.client + ": " + bloc.dataList.value.orders[i].client ?? " ",
        delivery:
            l10n.delivery + ": " + bloc.dataList.value.orders[i].daliveryDate ??
                " ",
        requested:
            l10n.requested + ": " + bloc.dataList.value.orders[i].requestDate ??
                " ",
        type: l10n.type + ": " + bloc.dataList.value.orders[i].type ?? " ",
      ));
    }
    return list;
  }
}

class _InfoCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final int codeSicom;
  final String buyer;
  final String client;
  final String type;
  final String delivery;
  final String requested;

  _InfoCard(
      {this.onTap,
      this.codeSicom,
      this.buyer,
      this.client,
      this.type,
      this.delivery,
      this.requested});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16.0,
                ),
                child: Text(
                  codeSicom.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(0, 0, 0, 0.85),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 16.0,
                ),
                child: Text(buyer),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                  left: 16.0,
                ),
                child: Text(client),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                  left: 16.0,
                ),
                child: Text(type),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      delivery,
                      style: TextStyle(
                          fontSize: 12.0, color: Color.fromRGBO(0, 0, 0, 0.65)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      requested,
                      style: TextStyle(
                          fontSize: 12.0, color: Color.fromRGBO(0, 0, 0, 0.65)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
