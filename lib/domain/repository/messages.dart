import 'package:driver_app/domain/model/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages();
}
