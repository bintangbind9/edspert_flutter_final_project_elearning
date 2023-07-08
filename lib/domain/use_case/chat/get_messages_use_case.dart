import 'package:edspert_flutter_final_project_elearning/domain/repository/chat_repository.dart';

import '../../../data/model/chat_item.dart';

class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase({required this.repository});

  Future<List<ChatItem>> call() async => await repository.getMessages();
}