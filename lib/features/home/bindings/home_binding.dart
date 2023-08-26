import 'package:driver_app/app/di/di.dart';
import 'package:driver_app/features/home/controllers/home_controller.dart';
import 'package:driver_app/features/home/controllers/schedule_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => di<HomeController>());
    Get.lazyPut<ScheduleController>(() => di<ScheduleController>());
  }
}