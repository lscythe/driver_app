import 'package:driver_app/data/datasource/schedule_local_data_source.dart';
import 'package:driver_app/data/source/local/entity/schedule.dart';
import 'package:driver_app/domain/model/schedule.dart';
import 'package:driver_app/domain/repository/schedules.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ScheduleRepository)
class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleLocalDataSource _localDataSource;

  ScheduleRepositoryImpl(this._localDataSource);

  @override
  Future<void> addSchedule(Schedule schedule) async {
    return await _localDataSource
        .addSchedule(ScheduleEntity(schedule.date, schedule.status));
  }

  @override
  Future<List<Schedule>> getSchedules() async {
    final schedules = await _localDataSource.getSchedules();
    return schedules
        .map((e) => Schedule(id: e.id!, date: e.date, status: e.status))
        .toList();
  }
}
