import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    Intl.defaultLocale = locale.languageCode;
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  set localizedValues(Map<String, dynamic> value) {
    if (value == null) {
      value = {};
    }
    _localizedValues = value;
  }

  String getLocalizedValue(String key) {
    if (key != null && _localizedValues.containsKey(key)) {
      return _localizedValues[key];
    }
    return key;
  }

  static Map<String, dynamic> _localizedValues = {
    'password': 'Contraseña',
    'forgotUserNameQuestion': '¿Olvidaste tu usuario?',
    'continue': 'Continuar',
    'signInText': 'Iniciar sesión',
    'cancel': 'Cancelar',
    'errorTitleCustomAlert': '¡Lo sentimos!',
    'authWrongCredentialsError':
        'Verifica tus credenciales, usuario y/o contraseña no válida.',
    'accept': 'Aceptar',
    'unlockPasswordText': 'Desbloquear contraseña',
    'defaultTitleError': 'Error',
    'profile': 'Perfil',
    'list': 'Listado',
    'agent': 'Agente',
    'type': 'Tipo',
    'user': 'Usuario',
    'name': 'Nombre',
    'logout': 'Cerrar Sesión',
    'orders': 'Ordenes de pedido',
    'orderRegisters': 'Útimos registros',
    'filters': 'Filtros',
    'codeAutorization': 'Código de autorización',
    'codeSicomClient': 'Codigo SICOM Cliente',
    'typeOrder': 'Tipo de orden',
    'typebuyer': 'Tipo de comprador',
    'buyersubtype': 'Subtipo de comprador',
    'tradename': 'Nombre comercial',
    'buyersNit': 'Nit del comprador:',
    'department': 'Departamento:',
    'municipality': 'Municipio:',
    'address': 'Dirección:',
    'installationDepartment': 'departamentoi nstalación',
    'typeProvider': 'Tipo de proveedor',
    'tradenameProvider': 'Nombre comercial',
    'supplyPlant': 'Planta de abastecimiento',
    'dateInitial': 'Fecha de entrega sugerida',
    'dateFinal': 'Fecha de entrega sugerida fin',
    'filter': 'FILTRAR',
    'removeFilter': 'QUITAR FILTROS',
    'buyer': 'Comprador',
    'client': 'Cliente',
    'delivery': 'Entrega',
    'requested': 'Solicitado',
    'transportType': "Tipo de transporte",
    'vehicleIdentification': "Numero de placa",
    'driver': 'Conductor',
    'driverIdentification': 'Numero de cedula',
    'totalCapacity': 'Capacidad total',
    'state': 'Estado',
    'observations': 'Observaciones',
    'deliverDate': 'Fecha sugerida de entrega:',
    'invoiceNumber': 'Número de factura:',
    'uniqueTransportationGuide': 'Guía única de transporte',
    'validitySingleTransportGuide': 'Vigencia de la guía única de transporte',
    'transPortType': 'Tipo de trasporte',
    'orderWithinBorderQuota': 'Pedido dentro del cupo frontera',
    'orderWithinNationlQuota': 'Pedido dentro del cupo nacional',
    'aditionalInformation': 'Informacion adicional ',
    'urlSicom': 'https://www.sicom.gov.co/sicom/identificacionAction.do',
    'ordenStatus': 'Estado de la orden',
    'loadingOrders': 'Cargando pedidos...',
    'loadingProfile': 'Cargando perfil...',
  };

  String get password => getLocalizedValue('password');

  String get user => getLocalizedValue('user');

  String get forgotUserNameQuestion =>
      getLocalizedValue('forgotUserNameQuestion');

  String get continueKey => getLocalizedValue('continue');

  String get signInText => getLocalizedValue('signInText');

  String get cancel => getLocalizedValue('cancel');

  String get errorTitleCustomAlert =>
      getLocalizedValue('errorTitleCustomAlert');

  String get authWrongCredentialsError =>
      getLocalizedValue('authWrongCredentialsError');

  String get accept => getLocalizedValue('accept');

  String get unlock => getLocalizedValue('unlock');

  String get defaultTitleError => getLocalizedValue('defaultTitleError');

  String get profile => getLocalizedValue('profile');

  String get list => getLocalizedValue('list');

  String get agent => getLocalizedValue('agent');

  String get type => getLocalizedValue('type');

  String get name => getLocalizedValue('name');

  String get logout => getLocalizedValue('logout');

  String get orders => getLocalizedValue('orders');

  String get orderRegisters => getLocalizedValue('orderRegisters');

  String get filters => getLocalizedValue('filters');

  String get codeAutorization => getLocalizedValue('codeAutorization');

  String get codeSicomClient => getLocalizedValue('codeSicomClient');

  String get typeOrder => getLocalizedValue('typeOrder');

  String get typeBuyer => getLocalizedValue('typebuyer');

  String get buyerSubtype => getLocalizedValue('buyersubtype');

  String get tradeName => getLocalizedValue('tradename');

  String get buyersNit => getLocalizedValue('BuyersNit');

  String get department => getLocalizedValue('department');

  String get municipality => getLocalizedValue('Municipality');

  String get address => getLocalizedValue('Address');

  String get installationDepartment =>
      getLocalizedValue('installationDepartment');

  String get typeProvider => getLocalizedValue('typeProvider');

  String get tradenameProvider => getLocalizedValue('tradenameProvider');

  String get supplyPlant => getLocalizedValue('supplyPlant');

  String get dateInitial => getLocalizedValue('dateInitial');

  String get dateFinal => getLocalizedValue('dateFinal');

  String get filter => getLocalizedValue('filter');

  String get removeFilter => getLocalizedValue('removeFilter');

  String get buyer => getLocalizedValue('buyer');

  String get client => getLocalizedValue('client');

  String get delivery => getLocalizedValue('delivery');

  String get requested => getLocalizedValue('requested');

  String get transportType => getLocalizedValue('transportType');

  String get vehicleIdentification =>
      getLocalizedValue('vehicleIdentification');

  String get driver => getLocalizedValue('driver');

  String get driverIdentification => getLocalizedValue('driverIdentification');

  String get totalCapacity => getLocalizedValue('totalCapacity');

  String get state => getLocalizedValue('state');

  String get observation => getLocalizedValue('observation');

  String get deliverDate => getLocalizedValue('deliverDate');

  String get invoiceNumber => getLocalizedValue('InvoiceNumber');

  String get uniqueTransportationGuide =>
      getLocalizedValue('uniqueTransportationGuide');

  String get validitySingleTransportGuide =>
      getLocalizedValue('ValiditySingleTransportGuide');

  String get transPortType => getLocalizedValue('transPortType');

  String get orderWithinBorderQuota =>
      getLocalizedValue('orderWithinBorderQuota');

  String get orderWithNationalQuota =>
      getLocalizedValue('orderWithinNationlQuota');

  String get additionalInformation => getLocalizedValue('aditionalInformation');

  String get urlSicom => getLocalizedValue('urlSicom');

  String get orderStatus => getLocalizedValue('ordenStatus');

  String get loadingOrders => getLocalizedValue('loadingOrders');

  String get loadingProfile => getLocalizedValue('loadingProfile');
}
