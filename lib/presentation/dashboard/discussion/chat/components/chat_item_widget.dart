import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/discussion/group_list_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/firestore/message.dart';

class ChatItemWidget extends StatelessWidget {
  final MessageModel message;

  ChatItemWidget({required this.message, super.key});

  final GroupListController groupListController = Get.find<GroupListController>();

  @override
  Widget build(BuildContext context) {
    bool isSender = message.email == FirebaseAuth.instance.currentUser!.email;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: !isSender
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            isSender ? 'Saya' : message.email,
            style: TextStyle(color: isSender ? const Color(0xff03BDB9) : Colors.black),
          ),
          Card(
            color: isSender ? const Color(0xff3A7FD5) : Colors.white,
            margin: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: isSender
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomLeft: const Radius.circular(12),
                  topLeft: !isSender
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  topRight: const Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                message.message,
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            groupListController.timeAgo.getIdTimeMessage(message.time.toDate()),
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xff979797),
            ),
          ),
        ],
      ),
    );
  }
}