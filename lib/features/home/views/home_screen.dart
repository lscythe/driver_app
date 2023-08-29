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
        title: const Text(
          "SCHEDULING SYSTEM",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.png"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFececef),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    color: Colors.white),
              ),
            ),
            Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Obx(
                      () => IndexedStack(
                        index: controller.currentIndex.value,
                        children: _screens,
                      ),
                    ),
                  ),
                ),
                _bottomNavBar()
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Obx(
      //       () => ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       topRight: Radius.circular(50),
      //       topLeft: Radius.circular(50),
      //     ),
      //     child: Container(
      //       child: BottomNavigationBar(
      //         elevation: 0,
      //         showSelectedLabels: false,
      //         backgroundColor: const Color(0xFFe5714b),
      //         selectedItemColor: Colors.white,
      //         unselectedItemColor: const Color(0xFF3a5382),
      //         items: _navItems,
      //         currentIndex: controller.currentIndex.value,
      //         type: BottomNavigationBarType.fixed,
      //         showUnselectedLabels: false,
      //         onTap: controller.onItemTap,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _bottomNavBar() {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          color: Color(0xFFe5714b),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  controller.onItemTap(0);
                },
                icon: Icon(
                  Icons.schedule,
                  color: controller.currentIndex == 0
                      ? Colors.white
                      : const Color(0xFF3a5382),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.onItemTap(1);
                },
                icon: Icon(
                  Icons.calendar_today,
                  color: controller.currentIndex == 1
                      ? Colors.white
                      : const Color(0xFF3a5382),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.onItemTap(2);
                },
                icon: Icon(
                  Icons.local_shipping,
                  color: controller.currentIndex == 2
                      ? Colors.white
                      : const Color(0xFF3a5382),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.onItemTap(3);
                },
                icon: Icon(
                  Icons.mail_outline,
                  color: controller.currentIndex == 3
                      ? Colors.white
                      : const Color(0xFF3a5382),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
