import '../../data/model/chat_item.dart';

abstract class ChatRepository {
  Future<List<ChatItem>> getMessages();
}