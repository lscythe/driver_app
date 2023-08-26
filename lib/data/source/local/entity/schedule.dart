import 'package:driver_app/domain/model/schedule.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "schedules")
class ScheduleEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final DateTime date;

  final ScheduleStatus status;

  ScheduleEntity(this.date, this.status, {this.id});
}
