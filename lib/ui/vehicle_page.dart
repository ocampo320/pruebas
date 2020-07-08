import 'package:app/blocs/vehicle_bloc.dart';
import 'package:app/ui/base_state.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends BaseState<VehiclePage, VehicleBloc> {
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
                            l10n.vehicleIdentification,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.driver,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.driverIdentification,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, left: 16.0),
                          child: Text(
                            l10n.totalCapacity,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
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
  VehicleBloc getBlocInstance() {
    return VehicleBloc();
  }
}
