import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetGroupStreamUseCase {
  final FirestoreRepository firestoreRepository;

  GetGroupStreamUseCase({required this.firestoreRepository});

  Stream<DocumentSnapshot> call({required String groupId}) {
    return firestoreRepository.getGroupStream(groupId: groupId);
  }
}