import 'package:driver_app/features/home/controllers/home_controller.dart';
import 'package:driver_app/features/home/views/page/calendar/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static final _navItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.schedule), label: "Clock In"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today), label: "Schedule"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.local_shipping), label: "Shipping"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.mail_outline), label: "Message")
  ];

  static final _screens = [
    const Center(
      child: Text("Feature not implemented yet"),
    ),
    CalendarPage(),
    const Center(
      child: Text("Feature not implemented yet"),
    ),
    const Center(
      child: Text("Feature not implemented yet"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scheduling"),
        leading: const Icon(Icons.calendar_month),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: _screens,
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: _navItems,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          onTap: controller.onItemTap,
        ),
      ),
    );
  }
}
