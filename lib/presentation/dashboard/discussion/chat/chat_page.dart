import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/firestore/message.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/discussion/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import 'components/chat_item_widget.dart';
import 'components/input_chat_widget.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Expanded(
              child: _buildChatListView(context),
            ),
            _buildBottomChatOperation(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(controller.groupArg.groupName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      foregroundColor: AppColors.grayscaleOffWhite,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget _buildChatListView(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final message = controller.messages[index];
            return ChatItemWidget(message: message);
          },
          padding: const EdgeInsets.symmetric(vertical: 16),
          reverse: true,
        ));
  }

  Widget _buildBottomChatOperation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      margin: const EdgeInsets.all(0),
      child: InputChatWidget(
        onTapSend: () => onSend(context),
      ),
    );
  }

  void onSend(BuildContext context) {
    // final fileName = controller.selectedFile?.name;
    // debugPrint(fileName);
    if (controller.tecChatContent.text.trim().isNotEmpty) {
      controller.sendChat(MessageModel(email: controller.senderEmail ?? 'Anonymous', message: controller.tecChatContent.text, time: Timestamp.now()));
      controller.tecChatContent.text = '';
    }
  }
}
