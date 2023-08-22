import 'package:edspert_flutter_final_project_elearning/data/model/firestore/group.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/discussion/group_list_controller.dart';
import 'package:edspert_flutter_final_project_elearning/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';

class GroupListPage extends GetView<GroupListController> {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscaleBackground,
      appBar: AppBar(
      title: const Text('Diskusi Soal',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: AppColors.grayscaleOffWhite)),
      backgroundColor: AppColors.primary,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
      body: Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.groups.length,
          itemBuilder: (context, index) {
            GroupModel group = controller.groups[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.chatPage, arguments: group);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.secondary,
                    child: Text(group.groupName.substring(0,1).toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                  ),
                  title: Text(group.groupName, style: const TextStyle(fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                  subtitle: Text("${group.recentMessageSender}: ${group.recentMessage}", style: const TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis,),
                  trailing: Text(controller.timeAgo.getIdShortTimeMessage(group.recentMessageTime.toDate()))
                ),
              ),
            );
          })),
    );
  }
}