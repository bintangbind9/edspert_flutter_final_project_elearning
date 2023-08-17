import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetChatsStreamUseCase {
  final FirestoreRepository firestoreRepository;

  GetChatsStreamUseCase({required this.firestoreRepository});

  Stream<QuerySnapshot<Map<String, dynamic>>> call({required String groupId}) {
    return firestoreRepository.getChatsStream(groupId: groupId);
  }
}