import 'package:driver_app/app/di/di.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => di.init();

