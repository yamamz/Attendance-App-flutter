import 'package:class_room_app/injection.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo, env: ['prod'])
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({@required this.dataConnectionChecker});

  final DataConnectionChecker dataConnectionChecker;

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
