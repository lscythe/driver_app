enum ScheduleStatus { assigned, leave, unpaidLeave, sickLeave, standby }

class Schedule {
  final int id;
  final DateTime date;
  final ScheduleStatus status;

  Schedule({required this.id, required this.date, required this.status});
}
