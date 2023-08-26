import 'package:driver_app/data/source/local/entity/schedule.dart';
import 'package:floor/floor.dart';

@dao
abstract class ScheduleDao {
  @Query('SELECT * FROM schedules')
  Future<List<ScheduleEntity>> getSchedules();

  @insert
  Future<void> insertSchedule(ScheduleEntity entity);
}