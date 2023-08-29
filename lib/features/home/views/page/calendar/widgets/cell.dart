import 'package:calendar_view/calendar_view.dart';
import 'package:driver_app/domain/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CellWidget extends StatelessWidget {
  const CellWidget({
    super.key,
    required this.events,
    required this.isInMonth,
    required this.isToday,
    required this.date,
    required this.onDateTap,
  });

  final List<CalendarEventData<Object?>> events;
  final bool isInMonth;
  final bool isToday;
  final DateTime date;
  final Function(DateTime date) onDateTap;

  static final _dateFormatter = DateFormat.d();

  @override
  Widget build(BuildContext context) {
    final List<Schedule> schedules =
        events.map((e) => e.event as Schedule).toList();

    return GestureDetector(
      onTap: () {
        if (isInMonth) {
          onDateTap(date);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: _getCellBackgroundColor(schedules),
        ),
        child: Center(
          child: Container(
            decoration: isToday
                ? const BoxDecoration(
                    color: Color(0xFFbdc3de),
                    shape: BoxShape.circle,
                  )
                : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _dateFormatter.format(date),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: _getCellTextColor(schedules)),
                  ),
                  _getEventName(schedules) != null
                      ? Flexible(
                      fit: FlexFit.loose,
                          child: Text(
                          _getEventName(schedules) ?? "",
                          style: const TextStyle(fontSize: 10),
                        ))
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getCellBackgroundColor(List<Schedule> schedules) {
    if (schedules.any((e) => e.status == ScheduleStatus.assigned)) {
      return const Color(0xFF4d5fa9);
    } else if (schedules.any((e) => e.status == ScheduleStatus.sickLeave)) {
      return const Color(0xFFffb9a7);
    } else if (schedules.any((e) => e.status == ScheduleStatus.leave)) {
      return const Color(0xFFebfecc);
    } else if (schedules.any((e) => e.status == ScheduleStatus.unpaidLeave)) {
      return const Color(0xFFd2f8ff);
    } else if (schedules.any((e) => e.status == ScheduleStatus.standby)) {
      return const Color(0xFFfffc00);
    } else if (isInMonth) {
      return Colors.white;
    } else {
      return const Color(0xFFf2f6f8);
    }
  }

  String? _getEventName(List<Schedule> schedules) {
    if (schedules.any((e) => e.status == ScheduleStatus.sickLeave)) {
      return "MC";
    } else if (schedules.any((e) => e.status == ScheduleStatus.leave)) {
      return "L";
    } else if (schedules.any((e) => e.status == ScheduleStatus.unpaidLeave)) {
      return "UL";
    } else {
      return null;
    }
  }

  Color _getCellTextColor(List<Schedule> schedules) {
    if (schedules.any((e) => e.status == ScheduleStatus.assigned)) {
      return Colors.white;
    } else if (!isInMonth && isToday) {
      return Colors.black;
    } else if (isToday) {
      return Colors.black;
    } else if (isInMonth) {
      return Colors.black;
    } else {
      return const Color(0xFFc0c4c6);
    }
  }
}
