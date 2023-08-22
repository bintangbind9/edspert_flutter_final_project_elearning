import 'package:edspert_flutter_final_project_elearning/domain/use_case/firestore/send_message_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/data_source/remote_data_source/firestore_remote_data_source.dart';
import '../../../../data/repository/firestore_repository_impl.dart';
import '../../../../domain/repository/firestore_repository.dart';
import '../../../../domain/use_case/firestore/get_messages_stream_use_case.dart';
import 'chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FirestoreRemoteDataSource>(FirestoreRemoteDataSource(uid: FirebaseAuth.instance.currentUser!.uid));
    Get.put<FirestoreRepository>(FirestoreRepositoryImpl(firestoreRemoteDataSource: Get.find<FirestoreRemoteDataSource>()));
    Get.put<GetMessagesStreamUseCase>(GetMessagesStreamUseCase(firestoreRepository: Get.find<FirestoreRepository>()));
    Get.put<SendMessageUseCase>(SendMessageUseCase(firestoreRepository: Get.find<FirestoreRepository>()));
    Get.put(ChatController(getMessagesStreamUseCase: Get.find<GetMessagesStreamUseCase>(), sendMessageUseCase: Get.find<SendMessageUseCase>()));
  }
}