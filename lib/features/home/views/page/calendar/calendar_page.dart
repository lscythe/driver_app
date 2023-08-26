import 'package:calendar_view/calendar_view.dart';
import 'package:driver_app/domain/model/schedule.dart';
import 'package:driver_app/features/home/controllers/schedule_controller.dart';
import 'package:driver_app/features/home/views/page/calendar/widgets/cell.dart';
import 'package:driver_app/features/home/views/page/calendar/widgets/request_leave_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part 'widgets/header.dart';

part 'widgets/week_day.dart';

class CalendarPage extends GetView<ScheduleController> {
  final GlobalKey<MonthViewState> _key = GlobalKey();

  CalendarPage({super.key});

  final _dropDownEntries = [
    const DropdownMenuEntry(
      value: ScheduleStatus.sickLeave,
      label: "Annual Leave",
    ),
    const DropdownMenuEntry(
      value: ScheduleStatus.unpaidLeave,
      label: "Unpaid Leave",
    ),
    const DropdownMenuEntry(
      value: ScheduleStatus.leave,
      label: "Sick Leave",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: controller.calendarController,
      child: Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: MonthView(
                      key: _key,
                      cellAspectRatio: 1,
                      borderColor: Colors.black26,
                      borderSize: 0.5,
                      headerBuilder: (date) => HeaderWidget(
                        date: date,
                        onChevronRightTap: _onNextPage,
                        onChevronLeftTap: _onPreviousPage,
                      ),
                      weekDayBuilder: (day) => WeekDayWidget(dayIndex: day),
                      cellBuilder: (date, event, isToday, isInMonth) =>
                          CellWidget(
                        events: event,
                        isInMonth: isInMonth,
                        isToday: isToday,
                        date: date,
                        onDateTap: (date) {
                          _showBottomSheet(date, context);
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Notifications",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
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
                              itemCount: controller.messages.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    controller.messages[index].message,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              },
                            );
                          }
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
      ),
    );
  }
}
