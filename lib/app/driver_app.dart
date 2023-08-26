import 'package:driver_app/app/routes/page_route.dart';
import 'package:driver_app/data/source/local/app_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: $FloorAppDatabase.databaseBuilder('driver.db').build(),
      builder: (context, snapshot) => GetMaterialApp(
        title: "Driver",
        initialRoute: PageRoutes.initial,
        getPages: PageRoutes.routes,
      ),
    );
  }
}
