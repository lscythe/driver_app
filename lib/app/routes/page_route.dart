import 'package:driver_app/features/home/bindings/home_binding.dart';
import 'package:driver_app/features/home/views/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part 'routes.dart';

class PageRoutes {
  static final initial = Routes.home.path;

  static final routes = [
    GetPage(
        name: Routes.home.path,
        page: () => Routes.home.page,
        binding: Routes.home.binding)
  ];
}
