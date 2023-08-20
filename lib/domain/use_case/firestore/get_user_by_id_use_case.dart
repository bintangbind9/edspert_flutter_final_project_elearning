import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetUserByIdUseCase {
  final FirestoreRepository firestoreRepository;

  GetUserByIdUseCase({required this.firestoreRepository});

  Future<DocumentSnapshot> call() async {
    return await firestoreRepository.getUserById();
  }
}