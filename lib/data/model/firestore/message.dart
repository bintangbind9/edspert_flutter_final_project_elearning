import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String email;
  final String message;
  final Timestamp time;

  MessageModel({required this.email, required this.message, required this.time});

  MessageModel.fromJson(Map<String, Object?> json)
    : this(
        email: json['email']! as String,
        message: json['message']! as String,
        time: json['time']! as Timestamp
      );

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'message': message,
      'time': time
    };
  }
}