import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class SearchGroupByNameUseCase {
  final FirestoreRepository firestoreRepository;

  SearchGroupByNameUseCase({required this.firestoreRepository});

  Future<QuerySnapshot> call({required String groupName}) async {
    return await firestoreRepository.searchGroupByName(groupName: groupName);
  }
}