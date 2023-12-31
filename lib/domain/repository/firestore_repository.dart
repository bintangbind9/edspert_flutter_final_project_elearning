import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/model/firestore/group.dart';
import '../../data/model/firestore/message.dart';

abstract class FirestoreRepository {
  Future<void> createOrUpdateUser({required String email});
  Future<QuerySnapshot> getUser({required String email});
  Future<DocumentSnapshot> getUserById();
  Stream<DocumentSnapshot> getUserStream();
  Stream<List<dynamic>> getUserGroupStream();
  Future<void> createGroup({required String userId, required String groupName});
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsStream({required String groupId});
  Stream<List<MessageModel>> getMessagesStream({required String groupId});
  Future<String> getGroupAdmin({required String groupId});
  Stream<DocumentSnapshot> getGroupStream({required String groupId});
  Stream<List<GroupModel>> getGroupsStream();
  Future<QuerySnapshot> searchGroupByName({required String groupName});
  Future<bool> isUserJoined({required String groupId});
  Future<void> toggleGroupJoin({required String groupId});
  Future<void> sendMessage({required String groupId, required MessageModel message});
}