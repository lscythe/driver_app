import 'package:driver_app/domain/model/schedule.dart';

abstract class ScheduleRepository {
  Future<List<Schedule>> getSchedules();

  Future<void> addSchedule(Schedule schedule);
}
