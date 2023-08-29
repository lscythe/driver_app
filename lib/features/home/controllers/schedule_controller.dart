import 'package:calendar_view/calendar_view.dart';
import 'package:driver_app/domain/model/message.dart';
import 'package:driver_app/domain/model/schedule.dart';
import 'package:driver_app/domain/repository/messages.dart';
import 'package:driver_app/domain/repository/schedules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@singleton
class ScheduleController extends GetxController {
  final ScheduleRepository _scheduleRepo;
  final MessageRepository _messageRepo;

  ScheduleController(this._scheduleRepo, this._messageRepo);

  final EventController calendarController = EventController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  final RxList<Message> _messagesObs = List<Message>.empty().obs;

  List<Message> get messages => _messagesObs.toList();

  final RxList<Schedule> _schedulesObs = List<Schedule>.empty().obs;

  List<Schedule> get schedules => _schedulesObs.toList();

  final Rx<ScheduleStatus> _selectedStatus = ScheduleStatus.leave.obs;
  ScheduleStatus get status => _selectedStatus.value;

  @override
  void onInit() {
    super.onInit();
    _getMessages();
    _getSchedule();
  }

  void setSelectedStatus(ScheduleStatus status) {
    _selectedStatus.value = status;
  }

  void _getMessages() async {
    final result = await _messageRepo.getMessages();
    _messagesObs.value = result;
    print(result);
  }

  void _getSchedule() async {
    final result = await _scheduleRepo.getSchedules();
    _schedulesObs.value = result;
    calendarController.addAll(schedules
        .map((e) => CalendarEventData(
              title: "Schedule",
              date: e.date,
              event: e,
            ))
        .toList());
    print(result);
  }

  @override
  void dispose() {
    dateController.dispose();
    dayController.dispose();
    super.dispose();
  }
}
