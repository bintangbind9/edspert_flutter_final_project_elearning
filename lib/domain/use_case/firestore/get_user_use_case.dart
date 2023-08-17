import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetUserUseCase {
  final FirestoreRepository firestoreRepository;

  GetUserUseCase({required this.firestoreRepository});

  Future<QuerySnapshot> call({required String email}) async {
    return await firestoreRepository.getUser(email: email);
  }
}