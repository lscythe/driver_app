import 'package:driver_app/app/di/di.dart';
import 'package:driver_app/app/driver_app.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(const DriverApp());
}
