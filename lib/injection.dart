import 'package:class_room_app/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String enviroment) async =>
    $initGetIt(getIt, environment: enviroment);
