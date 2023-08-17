import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class CreateOrUpdateUserUseCase {
  final FirestoreRepository firestoreRepository;

  CreateOrUpdateUserUseCase({required this.firestoreRepository});

  Future<void> call({required String email}) async {
    return await firestoreRepository.createOrUpdateUser(email: email);
  }
}