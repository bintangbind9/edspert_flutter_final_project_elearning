import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/firestore_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/message.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';

class FirestoreRepositoryImpl implements FirestoreRepository{
  final FirestoreRemoteDataSource firestoreRemoteDataSource;

  FirestoreRepositoryImpl({required this.firestoreRemoteDataSource});

  @override
  Future<void> createGroup({required String userId, required String groupName}) async {
    return await firestoreRemoteDataSource.createGroup(userId: userId, groupName: groupName);
  }

  @override
  Future<void> createOrUpdateUser({required String email}) async {
    return await firestoreRemoteDataSource.createOrUpdateUser(email: email);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsStream({required String groupId}) {
    return firestoreRemoteDataSource.getChatsStream(groupId: groupId);
  }

  @override
  Future<String> getGroupAdmin({required String groupId}) async {
    return await firestoreRemoteDataSource.getGroupAdmin(groupId: groupId);
  }

  @override
  Stream<DocumentSnapshot<Object?>> getGroupStream({required String groupId}) {
    return firestoreRemoteDataSource.getGroupStream(groupId: groupId);
  }

  @override
  Future<QuerySnapshot<Object?>> getUser({required String email}) async {
    return await firestoreRemoteDataSource.getUser(email: email);
  }

  @override
  Stream<DocumentSnapshot<Object?>> getUserStream() {
    return firestoreRemoteDataSource.getUserStream();
  }

  @override
  Future<bool> isUserJoined({required String groupId}) async {
    return await firestoreRemoteDataSource.isUserJoined(groupId: groupId);
  }

  @override
  Future<QuerySnapshot<Object?>> searchGroupByName({required String groupName}) async {
    return await firestoreRemoteDataSource.searchGroupByName(groupName: groupName);
  }

  @override
  Future<void> sendMessage({required String groupId, required Message message}) async {
    return await firestoreRemoteDataSource.sendMessage(groupId: groupId, message: message);
  }

  @override
  Future<void> toggleGroupJoin({required String groupId}) async {
    return await firestoreRemoteDataSource.toggleGroupJoin(groupId: groupId);
  }
  
  @override
  Future<DocumentSnapshot<Object?>> getUserById() async {
    return await firestoreRemoteDataSource.getUserById();
  }
  
  @override
  Stream<List<dynamic>> getUserGroupStream() {
    return firestoreRemoteDataSource.getUserGroupStream();
  }
}