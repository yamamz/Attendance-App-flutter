import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class RegisterModule {
  @LazySingleton(env: ['prod'])
  Dio get dio => Dio();

  @LazySingleton(env: ['prod'])
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();

  @LazySingleton(env: ['prod'])
  NavigationService get navigationService;
  @LazySingleton(env: ['prod'])
  DialogService get dialogService;
  @LazySingleton(env: ['prod'])
  SnackbarService get snackBarService;
}
