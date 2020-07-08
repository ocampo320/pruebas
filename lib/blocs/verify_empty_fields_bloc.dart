import 'dart:async';

import 'package:app/blocs/provider/bloc.dart';
import 'package:models/order_type.dart';
import 'package:rxdart/rxdart.dart';

class VerifyEmptyFieldsBloc extends Bloc {
  String documentType = '';
  String documentNumber = '';

  //campos

  final _loadingSubject = BehaviorSubject<bool>();
  final _emptyFieldsSubject = BehaviorSubject<bool>();
  final _ordersTypesController = BehaviorSubject<List<OrderType>>();
  final _documentTypeController = StreamController<String>();
  final _documentNumberController = StreamController<String>();

  ValueStream<bool> get loading => _loadingSubject.stream;

  ValueStream<bool> get emptyFields => _emptyFieldsSubject.stream;

  ValueStream<List<OrderType>> get ordersTypes => _ordersTypesController.stream;

  Sink<String> get documentTypeSink => _documentTypeController.sink;

  Sink<String> get documentNumberSink => _documentNumberController.sink;

  void validateEmptyFields(String documentType, String documentNumber) {
    if (documentType.isEmpty || documentNumber.trim().isEmpty) {
      _emptyFieldsSubject.add(true);
    } else {
      _emptyFieldsSubject.add(false);
    }
  }

  @override
  void dispose() {
    _loadingSubject.close();
    _emptyFieldsSubject.close();
    _documentTypeController.close();
    _documentNumberController.close();
    _ordersTypesController.close();
  }
}
