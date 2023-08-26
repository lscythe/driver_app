import 'package:driver_app/data/source/local/app_database.dart';
import 'package:driver_app/data/source/local/entity/message.dart';
import 'package:injectable/injectable.dart';

@singleton
class MessageLocalDataSource {
  final AppDatabase _db;

  MessageLocalDataSource(this._db);

  Future<List<MessageEntity>> getMessages() async => await _db.messageDao.getMessages();
}
