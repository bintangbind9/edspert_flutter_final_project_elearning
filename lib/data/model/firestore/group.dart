import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  final String admin;
  final String groupIcon;
  final String groupId;
  final String groupName;
  final List<dynamic> members;
  final String recentMessage;
  final String recentMessageSender;
  final Timestamp recentMessageTime;

  GroupModel({
    required this.admin,
    required this.groupIcon,
    required this.groupId,
    required this.groupName,
    required this.members,
    required this.recentMessage,
    required this.recentMessageSender,
    required this.recentMessageTime
  });

  GroupModel.fromJson(Map<String, Object?> json)
    : this (
      admin: json['admin']! as String,
      groupIcon: json['groupIcon'] as String,
      groupId: json['groupId'] as String,
      groupName: json['groupName'] as String,
      members: json['members'] as List<dynamic>,
      recentMessage: json['recentMessage'] as String,
      recentMessageSender: json['recentMessageSender'] as String,
      recentMessageTime: json['recentMessageTime'] as Timestamp
    );

  Map<String, Object?> toJson() {
    return {
      'admin': admin,
      'groupIcon': groupIcon,
      'groupId': groupId,
      'groupName': groupName,
      'members': members,
      'recentMessage': recentMessage,
      'recentMessageSender': recentMessageSender,
      'recentMessageTime': recentMessageTime
    };
  }
}