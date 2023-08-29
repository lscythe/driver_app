import 'package:device_preview/device_preview.dart';
import 'package:driver_app/app/routes/page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      designSize: Size(360, 800),
      builder: (_, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: "Driver",
          initialRoute: PageRoutes.initial,
          getPages: PageRoutes.routes,
        );
      },
    );
  }
}
