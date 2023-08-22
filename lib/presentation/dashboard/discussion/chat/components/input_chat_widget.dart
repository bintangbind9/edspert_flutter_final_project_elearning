import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chat_controller.dart';

class InputChatWidget extends StatelessWidget {
  InputChatWidget({
    super.key,
    this.onTapSend,
  });

  final GestureTapCallback? onTapSend;

  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(width: 12,),
          Expanded(
            child: SizedBox(
              height: 32,
              child: TextFormField(
                controller: chatController.tecChatContent,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF6F6F6),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  hintText: 'Ketuk untuk menulis....',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onTapSend,
            icon: const Icon(
              Icons.send,
              color: Color(0xff3A7FD5),
            ),
          ),
        ],
      ),
    );
  }
}