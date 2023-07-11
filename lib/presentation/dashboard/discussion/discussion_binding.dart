import 'package:get/get.dart';

import '../../../data/data_source/local_data_source/chat_local_data_source.dart';
import '../../../data/repository/chat_repository_impl.dart';
import '../../../domain/repository/chat_repository.dart';
import '../../../domain/use_case/chat/get_messages_use_case.dart';
import 'discussion_controller.dart';

class DiscussionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatLocalDataSource>(ChatLocalDataSource());
    Get.put<ChatRepository>(ChatRepositoryImpl(chatLocalDataSource: Get.find<ChatLocalDataSource>()));
    Get.put<GetMessagesUseCase>(GetMessagesUseCase(repository: Get.find<ChatRepository>()));
    Get.put(DiscussionController(getMessagesUseCase: Get.find<GetMessagesUseCase>()));
  }
}