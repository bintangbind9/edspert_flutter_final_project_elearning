import 'package:edspert_flutter_final_project_elearning/data/model/firestore/group.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/firestore/get_messages_stream_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/firestore/send_message_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/model/firestore/message.dart';

class ChatController extends GetxController {
  final GetMessagesStreamUseCase getMessagesStreamUseCase;
  final SendMessageUseCase sendMessageUseCase;

  ChatController({required this.getMessagesStreamUseCase, required this.sendMessageUseCase});
  
  final String? senderEmail = FirebaseAuth.instance.currentUser!.email;
  final Rx<List<MessageModel>> _messages = Rx<List<MessageModel>>([]);
  List<MessageModel> get messages => _messages.value;

  late GroupModel groupArg;

  final TextEditingController tecChatContent = TextEditingController();

  @override
  void onInit() {
    groupArg = Get.arguments as GroupModel;
    super.onInit();
  }

  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 2));
    retrieveMessages();
    super.onReady();
  }

  void retrieveMessages() {
    _messages.bindStream(getMessagesStreamUseCase.call(groupId: groupArg.groupId));
  }

  Future<void> sendChat(MessageModel message) async {
    return await sendMessageUseCase.call(groupId: groupArg.groupId, message: message);
  }
}