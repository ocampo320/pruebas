import 'package:app/blocs/order_detail_bloc.dart';
import 'package:app/ui/base_state.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.typeOrder,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.codeAutorization,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.state,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.observation,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.deliverDate,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.invoiceNumber,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.uniqueTransportationGuide,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.validitySingleTransportGuide,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
                        child: Text(
                          l10n.transPortType,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.orderWithinBorderQuota,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.orderWithNationalQuota,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
                        child: Text(
                          l10n.additionalInformation,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text(
                              "xxxxxxxx",
                              style: TextStyle(
                                  decorationStyle: TextDecorationStyle.solid),
                            )),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  @override
  OrderBloc getBlocInstance() {
    return OrderBloc();
  }
}
