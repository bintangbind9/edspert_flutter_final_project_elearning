import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class IsUserJoinedUseCase {
  final FirestoreRepository firestoreRepository;

  IsUserJoinedUseCase({required this.firestoreRepository});

  Future<bool> call({required String groupId}) async {
    return await firestoreRepository.isUserJoined(groupId: groupId);
  }
}