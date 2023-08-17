import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class ToggleGroupJoinUseCase {
  final FirestoreRepository firestoreRepository;

  ToggleGroupJoinUseCase({required this.firestoreRepository});

  Future<void> call({required String groupId}) async {
    return await firestoreRepository.toggleGroupJoin(groupId: groupId);
  }
}