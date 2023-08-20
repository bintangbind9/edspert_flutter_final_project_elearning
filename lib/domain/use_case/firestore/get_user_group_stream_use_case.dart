import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetUserGroupStreamUseCase {
  final FirestoreRepository firestoreRepository;

  GetUserGroupStreamUseCase({required this.firestoreRepository});

  Stream<List<dynamic>> call() {
    return firestoreRepository.getUserGroupStream();
  }
}