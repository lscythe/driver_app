import 'package:device_preview/device_preview.dart';
import 'package:driver_app/app/di/di.dart';
import 'package:driver_app/app/driver_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await configureDependencies();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const DriverApp(),
    ),
  );
}
