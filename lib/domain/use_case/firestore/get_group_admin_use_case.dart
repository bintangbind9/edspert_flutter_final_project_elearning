import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetGroupAdminUseCase {
  final FirestoreRepository firestoreRepository;

  GetGroupAdminUseCase({required this.firestoreRepository});

  Future<String> call({required String groupId}) async {
    return await firestoreRepository.getGroupAdmin(groupId: groupId);
  }
}