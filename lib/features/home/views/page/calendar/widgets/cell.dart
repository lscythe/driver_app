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
                    color: Colors.blueGrey,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _getCellTextColor(schedules)),
                  ),
                  _getEventName(schedules) != null
                      ? Text(_getEventName(schedules) ?? "")
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
      return Colors.blue;
    } else if (schedules.any((e) => e.status == ScheduleStatus.sickLeave)) {
      return Colors.red.shade400;
    } else if (schedules.any((e) => e.status == ScheduleStatus.leave)) {
      return Colors.greenAccent;
    } else if (schedules.any((e) => e.status == ScheduleStatus.unpaidLeave)) {
      return Colors.lightBlueAccent.shade200;
    } else if (schedules.any((e) => e.status == ScheduleStatus.standby)) {
      return Colors.yellow;
    } else if (isInMonth) {
      return Colors.white;
    } else {
      return Colors.grey.shade300;
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
    } else if (!isInMonth) {
      return Colors.grey.shade500;
    } else if (isToday) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
