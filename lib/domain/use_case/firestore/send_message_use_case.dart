import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

import '../../../data/model/firestore/message.dart';

class SendMessageUseCase {
  final FirestoreRepository firestoreRepository;

  SendMessageUseCase({required this.firestoreRepository});

  Future<void> call({required String groupId, required MessageModel message}) async {
    return await firestoreRepository.sendMessage(groupId: groupId, message: message);
  }
}