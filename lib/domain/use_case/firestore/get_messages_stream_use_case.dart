import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

import '../../../data/model/firestore/message.dart';

class GetMessagesStreamUseCase {
  final FirestoreRepository firestoreRepository;

  GetMessagesStreamUseCase({required this.firestoreRepository});

  Stream<List<MessageModel>> call({required String groupId}) {
    return firestoreRepository.getMessagesStream(groupId: groupId);
  }
}