import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/firestore/user.dart';

import '../../model/message.dart';

class FirestoreRemoteDataSource {
  final String? uid;
  FirestoreRemoteDataSource({this.uid});

  // reference for our collections
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection('groups');

  // saving the user data
  Future<void> createOrUpdateUser({required String email}) async {
    return await userCollection.doc(uid).set({
      "email": email,
      "groups": [],
      "uid": uid
    });
  }

  // get user
  Future<QuerySnapshot> getUser({required String email}) async {
    QuerySnapshot snapshot = await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // get user by uid
  Future<DocumentSnapshot> getUserById() async {
    return await userCollection.doc(uid).get();
  }

  // get user stream
  Stream<DocumentSnapshot> getUserStream() {
    return userCollection.doc(uid).snapshots();
  }

  // get user group stream
  Stream<List<dynamic>> getUserGroupStream() {
    final userModelRef = userCollection.withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (userModel, _) => userModel.toJson(),
    );
    return userModelRef.doc(uid).snapshots().map((DocumentSnapshot<UserModel> doc) {
      return doc.data()!.groups;
    });
  }

  // creating a group
  Future<void> createGroup({required String userId, required String groupName}) async {
    DocumentReference groupDocumentReference = await groupCollection.add({
      "groupName": groupName,
      "groupIcon": "",
      "admin": userId,
      "members": [],
      "groupId": "",
      "recentMessage": "",
      "recentMessageSender": ""
    });

    await groupDocumentReference.update({
      "members": FieldValue.arrayUnion([userId]),
      "groupId": groupDocumentReference.id
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups": FieldValue.arrayUnion([groupDocumentReference.id])
    });
  }

  // getting the chats
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsStream({required String groupId}) {
    return groupCollection.doc(groupId).collection('messages').orderBy('time', descending: true).snapshots();
  }

  // getting group admin
  Future<String> getGroupAdmin({required String groupId}) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'].toString();
  }

  // getting group members
  Stream<DocumentSnapshot> getGroupStream({required String groupId}) {
    return groupCollection.doc(groupId).snapshots();
  }

  // search group by name
  Future<QuerySnapshot> searchGroupByName({required String groupName}) async {
    return await groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  // check is user joined the group
  Future<bool> isUserJoined({required String groupId}) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<String> groups = await documentSnapshot['groups'];
    if (groups.contains(groupId)) {
      return true;
    } else {
      return false;
    }
  }

  // toggling the group join or exit
  Future<void> toggleGroupJoin({required String groupId}) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();
    List<String> groups = await userDocumentSnapshot['groups'];

    // if user has our groups -> then remove or also in other part re join
    String group = groupId;
    String member = uid!;
    if (groups.contains(group)) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove([group])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove([member])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion([group])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion([member])
      });
    }
  }

  // send message
  Future<void> sendMessage({required String groupId, required Message message}) async {
    Map<String, dynamic> chatMessageData = {
      "message": message.message,
      "sender": message.sender,
      "time": FieldValue.serverTimestamp()
    };
    await groupCollection.doc(groupId).collection("messages").add(chatMessageData);
    await groupCollection.doc(groupId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'],
    });
  }
}