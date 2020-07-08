import 'package:app/blocs/provider_detail_bloc.dart';
import 'package:app/ui/base_state.dart';
import 'package:flutter/material.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends BaseState<ProviderPage, ProviderBloc> {
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
                            l10n.typeProvider,
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
                            l10n.supplyPlant,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
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
                                const EdgeInsets.only(bottom: 35.0, left: 16.0),
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
  getBlocInstance() {
    return ProviderBloc();
  }
}
