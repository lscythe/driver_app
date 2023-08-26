import 'dart:async';

import 'package:driver_app/data/source/local/dao/message_dao.dart';
import 'package:driver_app/data/source/local/dao/schedule_dao.dart';
import 'package:driver_app/data/source/local/entity/message.dart';
import 'package:driver_app/data/source/local/entity/schedule.dart';
import 'package:driver_app/data/source/local/type_converter.dart';
import 'package:driver_app/domain/model/schedule.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [MessageEntity, ScheduleEntity])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  MessageDao get messageDao;

  ScheduleDao get scheduleDao;
}

final dbCallback = Callback(
  onCreate: (database, version) async {
    final batch = database.batch();
    batch.insert("messages", {
      'id': 1,
      'message': 'message 1',
    });
    batch.insert("messages", {
      'id': 2,
      'message': 'message 2',
    });

    batch.insert("schedules", {
      'id': 1,
      'date': DateTime(2023,8,1).millisecondsSinceEpoch,
      'status': 0
    });
    batch.insert("schedules", {
      'id': 2,
      'date': DateTime(2023,8,2).millisecondsSinceEpoch,
      'status': 0
    });
    batch.insert("schedules", {
      'id': 3,
      'date': DateTime(2023,8,3).millisecondsSinceEpoch,
      'status': 0
    });
    batch.insert("schedules", {
      'id': 4,
      'date': DateTime(2023,8,4).millisecondsSinceEpoch,
      'status': 1
    });
    batch.insert("schedules", {
      'id': 5,
      'date': DateTime(2023,8,5).millisecondsSinceEpoch,
      'status': 1
    });
    batch.insert("schedules", {
      'id': 6,
      'date': DateTime(2023,8,6).millisecondsSinceEpoch,
      'status': 4
    });
    batch.insert("schedules", {
      'id': 7,
      'date': DateTime(2023,8,7).millisecondsSinceEpoch,
      'status': 2
    });
    batch.insert("schedules", {
      'id': 8,
      'date': DateTime(2023,8,8).millisecondsSinceEpoch,
      'status': 3
    });
    batch.insert("schedules", {
      'id': 9,
      'date': DateTime(2023,8,9).millisecondsSinceEpoch,
      'status': 0
    });
    batch.insert("schedules", {
      'id': 10,
      'date': DateTime(2023,8,10).millisecondsSinceEpoch,
      'status': 2
    });
    await batch.commit();
  },
);
