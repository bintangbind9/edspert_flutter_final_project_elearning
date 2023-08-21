import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

import '../../../data/model/firestore/group.dart';

class GetGroupsStreamUseCase {
  final FirestoreRepository firestoreRepository;

  GetGroupsStreamUseCase({required this.firestoreRepository});

  Stream<List<GroupModel>> call() {
    return firestoreRepository.getGroupsStream();
  }
}