import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeController extends GetxController {
  final currentIndex = 0.obs;

  void onItemTap(int index) {
    currentIndex.value = index;
  }
}
