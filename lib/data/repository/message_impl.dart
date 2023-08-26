import 'package:driver_app/data/datasource/message_local_data_source.dart';
import 'package:driver_app/domain/model/message.dart';
import 'package:driver_app/domain/repository/messages.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final MessageLocalDataSource _localDataSource;

  MessageRepositoryImpl(this._localDataSource);

  @override
  Future<List<Message>> getMessages() async {
    final messages = await _localDataSource.getMessages();
    return messages.map((e) => Message(id: e.id, message: e.message)).toList();
  }
}
