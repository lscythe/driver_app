import 'package:calendar_view/calendar_view.dart';
import 'package:driver_app/features/home/controllers/schedule_controller.dart';
import 'package:driver_app/features/home/views/page/calendar/widgets/cell.dart';
import 'package:driver_app/features/home/views/page/calendar/widgets/request_leave_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part 'widgets/header.dart';

part 'widgets/week_day.dart';

class CalendarPage extends GetView<ScheduleController> {
  final GlobalKey<MonthViewState> _key = GlobalKey();

  CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: controller.calendarController,
      child: ListView(
        children: [
          MonthView(
            key: _key,
            cellAspectRatio: 1,
            cellHeight: 340.h,
            safeAreaOption: const SafeAreaOption(
              minimum: EdgeInsets.all(16),
            ),
            borderColor: Colors.black26,
            controller: controller.calendarController,
            borderSize: 0.5,
            startDay: WeekDays.monday,
            headerBuilder: (date) => HeaderWidget(
              date: date,
              onChevronRightTap: _onNextPage,
              onChevronLeftTap: _onPreviousPage,
            ),
            weekDayBuilder: (day) => WeekDayWidget(dayIndex: day),
            cellBuilder: (date, event, isToday, isInMonth) => CellWidget(
              events: event,
              isInMonth: isInMonth,
              isToday: isToday,
              date: date,
              onDateTap: (date) {
                _showBottomSheet(date, context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),
                ),
                Obx(() {
                  if (controller.messages.isEmpty) {
                    return const Text("No notifications yet");
                  } else {
                    return ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.messages[index].message,
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: double.maxFinite,
                                color: Colors.black,
                                height: 1,
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onNextPage() {
    _key.currentState?.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  void _onPreviousPage() {
    _key.currentState?.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  void _showBottomSheet(DateTime date, BuildContext context) {
    Get.dialog(
      RequestLeaveDialog(
        dateController: controller.dateController,
        dayController: controller.dayController,
        date: date,
        leaveType: (value) {

        },
      ),
    );
  }
}
