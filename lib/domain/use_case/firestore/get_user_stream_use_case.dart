import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class GetUserStreamUseCase {
  final FirestoreRepository firestoreRepository;

  GetUserStreamUseCase({required this.firestoreRepository});

  Stream<DocumentSnapshot> call() {
    return firestoreRepository.getUserStream();
  }
}