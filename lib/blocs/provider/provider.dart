import 'package:app/blocs/buyers_details_bloc.dart';
import 'package:app/blocs/home_bloc.dart';
import 'package:app/blocs/list_bloc.dart';
import 'package:app/blocs/login_bloc.dart';
import 'package:app/blocs/order_detail_bloc.dart';
import 'package:app/blocs/profile_bloc.dart';
import 'package:app/blocs/provider_detail_bloc.dart';
import 'package:app/blocs/vehicle_bloc.dart';

import '../list_detail_bloc.dart';
import '../splash_bloc.dart';
import 'bloc.dart';
import 'bloc_cache.dart';

class Provider {
  static T of<T extends Bloc>(Function instance) {
    switch (T) {
      case SplashBloc:
        {
          return BlocCache.getBlocInstance("SplashBloc", instance);
        }
      case LoginBloc:
        {
          return BlocCache.getBlocInstance("SignInBloc", instance);
        }
      case HomeBloc:
        {
          return BlocCache.getBlocInstance("HomeBloc", instance);
        }
      case ProfileBloc:
        {
          return BlocCache.getBlocInstance("ProfileBloc", instance);
        }
      case ListBloc:
        {
          return BlocCache.getBlocInstance("ListBloc", instance);
        }
      case ListDetailBloc:
        {
          return BlocCache.getBlocInstance("ListDetailBloc", instance);
        }
      case BuyerBloc:
        {
          return BlocCache.getBlocInstance("Buyer", instance);
        }
      case ProviderBloc:
        {
          return BlocCache.getBlocInstance("ProviderBloc", instance);
        }
      case OrderBloc:
        {
          return BlocCache.getBlocInstance("OrderBloc", instance);
        }
      case VehicleBloc:
        {
          return BlocCache.getBlocInstance("VehicleBloc", instance);
        }
    }
    return null;
  }

  static void dispose<T extends Bloc>() {
    switch (T) {
      case SplashBloc:
        {
          BlocCache.dispose("SplashBloc");
          break;
        }
      case LoginBloc:
        {
          BlocCache.dispose("SignInBloc");
          break;
        }
      case HomeBloc:
        {
          BlocCache.dispose("HomeBloc");
          break;
        }
      case ProfileBloc:
        {
          BlocCache.dispose("ProfileBloc");
          break;
        }
      case ListBloc:
        {
          BlocCache.dispose("ListBloc");
          break;
        }
      case ProviderBloc:
        {
          BlocCache.dispose("ProviderBloc");
          break;
        }
      case BuyerBloc:
        {
          BlocCache.dispose("BuyerBloc");
          break;
        }
      case OrderBloc:
        {
          BlocCache.dispose("OrderBloc");
          break;
        }
      case VehicleBloc:
        {
          BlocCache.dispose("VehicleBloc");
          break;
        }
    }
  }
}
