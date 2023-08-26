import 'package:floor/floor.dart';

@Entity(tableName: "messages")
class MessageEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String message;

  MessageEntity(this.id, this.message);
}