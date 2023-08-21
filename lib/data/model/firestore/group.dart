import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  final String groupIcon;
  final String groupId;
  final String groupName;
  final String recentMessage;
  final String recentMessageSender;
  final Timestamp recentMessageTime;

  GroupModel({
    required this.groupIcon,
    required this.groupId,
    required this.groupName,
    required this.recentMessage,
    required this.recentMessageSender,
    required this.recentMessageTime
  });

  GroupModel.fromJson(Map<String, Object?> json)
    : this (
      groupIcon: json['groupIcon'] as String,
      groupId: json['groupId'] as String,
      groupName: json['groupName'] as String,
      recentMessage: json['recentMessage'] as String,
      recentMessageSender: json['recentMessageSender'] as String,
      recentMessageTime: json['recentMessageTime'] as Timestamp
    );

  Map<String, Object?> toJson() {
    return {
      'groupIcon': groupIcon,
      'groupId': groupId,
      'groupName': groupName,
      'recentMessage': recentMessage,
      'recentMessageSender': recentMessageSender,
      'recentMessageTime': recentMessageTime
    };
  }
}