import 'package:app/blocs/buyers_details_bloc.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

class BuyerPage extends StatefulWidget {
  @override
  _BuyerPageState createState() => _BuyerPageState();
}

class _BuyerPageState extends BaseState<BuyerPage, BuyerBloc> {
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
                            l10n.typeBuyer,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.buyerSubtype,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.tradeName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.codeSicomClient,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.buyersNit,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.department,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.municipality,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.address,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
                        child: Text(
                          l10n.installationDepartment,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                const EdgeInsets.only(bottom: 23.0, left: 16.0),
                            child: Text("xxxxxxxx")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  @override
  BuyerBloc getBlocInstance() {
    return BuyerBloc();
  }
}
