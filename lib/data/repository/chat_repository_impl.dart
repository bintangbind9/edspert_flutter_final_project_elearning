import 'package:edspert_flutter_final_project_elearning/data/data_source/local_data_source/chat_local_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/chat_item.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource chatLocalDataSource;

  ChatRepositoryImpl({required this.chatLocalDataSource});

  @override
  Future<List<ChatItem>> getMessages() async =>
      await chatLocalDataSource.getMessages();
}