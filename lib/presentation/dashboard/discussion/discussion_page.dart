import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/model/chat_item.dart';
import '../dashboard_controller.dart';
import 'components/chat_item_widget.dart';
import 'discussion_controller.dart';
import 'components/input_chat_widget.dart';

/// C is a generic class can referred to other class based on assignment
/// In this case other engineer can create new controller but must extends
/// from [DiscussionController]. So, you will not double lifecycle execution.
class DiscussionPage<C extends DiscussionController> extends GetView<C> {
  static const routeName = '/discussion';

  const DiscussionPage({super.key});

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
              child: buildBody(context),
            ),
            _buildBottomChatOperation(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Diskusi Soal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
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

  Widget buildBody(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingMessages) {
        return buildLoading(context);
      }

      return _buildChatListView(context);
    });
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget _buildChatListView(BuildContext context) {
    return ListView.builder(
      itemCount: controller.messages.length,
      itemBuilder: (context, index) {
        final chat = controller.messages[index];
        return ChatItemWidget(chat: chat);
      },
      padding: const EdgeInsets.symmetric(vertical: 16),
      reverse: true,
    );
  }

  Widget _buildBottomChatOperation(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
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
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: bottomPadding),
        child: InputChatWidget(
          onTapAdd: () => onTapAdd(context),
          onTapCamera: () => onTapCamera(context),
          onTapSend: () => onSend(context),
        ),
      ),
    );
  }

  void onTapCamera(BuildContext context) {
    controller.openCamera();
  }

  void onSend(BuildContext context) {
    // final fileName = controller.selectedFile?.name;
    // debugPrint(fileName);
    controller.sendChat(ChatItem(
        content: controller.tecChatContent.text,
        id: 1,
        name: Get.find<DashboardController>().currentUser!.userName!,
        dateTime: DateTime.now(),
        isSender: true));
    controller.tecChatContent.text = '';
  }

  void onTapAdd(BuildContext context) {
    controller.openGallery();
  }
}