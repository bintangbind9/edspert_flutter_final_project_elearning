import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class CreateGroupUseCase {
  final FirestoreRepository firestoreRepository;

  CreateGroupUseCase({required this.firestoreRepository});

  Future<void> call({required String userId, required String groupName}) async {
    return await firestoreRepository.createGroup(userId: userId, groupName: groupName);
  }
}