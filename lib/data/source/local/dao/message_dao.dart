import 'package:driver_app/data/source/local/entity/message.dart';
import 'package:floor/floor.dart';

@dao
abstract class MessageDao {
  @Query('SELECT * FROM messages')
  Future<List<MessageEntity>> getMessages();
}