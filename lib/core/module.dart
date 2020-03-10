import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@registerModule
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
}
