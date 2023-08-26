import 'package:driver_app/data/source/local/app_database.dart';
import 'package:driver_app/data/source/local/entity/schedule.dart';
import 'package:injectable/injectable.dart';

@singleton
class ScheduleLocalDataSource {
  final AppDatabase _db;

  ScheduleLocalDataSource(this._db);

  Future<List<ScheduleEntity>> getSchedules() async => await _db.scheduleDao.getSchedules();

  Future<void> addSchedule(ScheduleEntity entity) async =>
      await _db.scheduleDao.insertSchedule(entity);
}
