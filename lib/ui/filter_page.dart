import 'package:app/blocs/verify_empty_fields_bloc.dart';
import 'package:app/ui/platform_widgets/platform__dropdown_button.dart';
import 'package:app/ui/platform_widgets/platform_app_bar.dart';
import 'package:app/ui/platform_widgets/platform_button.dart';
import 'package:app/ui/platform_widgets/platform_date_picker.dart';
import 'package:app/ui/platform_widgets/platform_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:models/order_type.dart';

import 'base_state.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends BaseState<FilterPage, VerifyEmptyFieldsBloc> {
  String placeholderDate = '';
  String placeholderDateFinish = '';
  String selectedItem = '';
  int selectedIndexTypeOrders = -1;
  int selectedIndexTypeOrderStatus = 0;
  final List<String> typeOrders = ['A', 'B', 'C', 'D'];
  final List<String> typeOrderStatus = ['Despachada'];

  DateTime dateSuggestedDelivery;
  DateTime dateSuggestedEndDelivery;

  DateTime minDateSuggestedDelivery;
  DateTime maxDateSuggestedDelivery;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PlatformAppBar(
        title: Text(l10n.filters),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 16.0,
                  ),
                  child: StreamBuilder<List<OrderType>>(
                      initialData: [],
                      // stream: bloc.ordersTypes,
                      builder: (context, documentTypesSnapshot) {
                        return PlatformDropdownButton(
                          hint: l10n.orderStatus,
                          items: typeOrderStatus,
                          selectedIndex: selectedIndexTypeOrderStatus,
                          onChanged: (position) {
                            setState(() {
                              selectedIndexTypeOrderStatus = position;
                            });
                          },
                          /* onSelectedCallback: (selectValue) {
                            selectedItem = selectValue; },  */
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 24.0,
                  ),
                  child: PlatformTextField(
                    labelText: l10n.codeAutorization,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 16.0,
                  ),
                  child: PlatformTextField(
                    labelText: l10n.codeSicomClient,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 16.0,
                  ),
                  child: StreamBuilder<List<OrderType>>(
                      initialData: [],
                      // stream: bloc.ordersTypes,
                      builder: (context, documentTypesSnapshot) {
                        return PlatformDropdownButton(
                          hint: l10n.typeOrder,
                          items: typeOrders,
                          selectedIndex: selectedIndexTypeOrders,
                          onChanged: (position) {
                            setState(() {
                              selectedIndexTypeOrders = position;
                            });
                          },
                          /* onSelectedCallback: (selectValue) {
                            selectedItem = selectValue; },  */
                        );
                      }),
                ),
                // _SelectDate(l10n.dateInitial),
                //_SelectDate(l10n.dateFinal),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 16.0,
                  ),
                  child: PlatformDatePicker(
                    label: l10n.dateInitial,
                    //hint: l10n.typeOrder,
                    disableSelectFutureDays: false,
                    value: placeholderDate,
                    onDateTimeChanged: (value) {
                      setState(() {
                        placeholderDate = DateFormat.yMMMd().format(value);
                        dateSuggestedDelivery = value;
                        dateSuggestedEndDelivery = null;
                        placeholderDateFinish = '';
                        minDateSuggestedDelivery = dateSuggestedDelivery;
                        maxDateSuggestedDelivery =
                            dateSuggestedDelivery.add(Duration(days: 90));
                      });
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    top: 16.0,
                  ),
                  child: AbsorbPointer(
                    absorbing: placeholderDate == '',
                    child: PlatformDatePicker(
                      label: l10n.dateFinal,
                      //hint: l10n.select,
                      disableSelectFutureDays: false,
                      value: placeholderDateFinish,
                      minDate: minDateSuggestedDelivery,
                      maxDate: maxDateSuggestedDelivery,
                      onDateTimeChanged: (value) {
                        setState(() {
                          placeholderDateFinish =
                              DateFormat.yMMMd().format(value);
                          dateSuggestedEndDelivery = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                  top: 16.0,
                ),
                child: PlatformButton(
                  onPressed: () {},
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  text: l10n.filter,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: PlatformButton(
                  onPressed: () {
                    print("press button");
                  },
                  isSecondary: true,
                  textColor: Colors.black,
                  text: l10n.removeFilter,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  VerifyEmptyFieldsBloc getBlocInstance() {
    return VerifyEmptyFieldsBloc();
  }
}

typedef SelectedCallback = void Function(String selectedItem);
