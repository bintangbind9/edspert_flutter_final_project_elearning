import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/discussion/group_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupListPage extends GetView<GroupListController> {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups Discussion'),
      ),
      body: Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.groups.length,
          itemBuilder: (context, index) {
            String groupId = controller.groups[index];
            return Text(groupId);
          })),
    );
  }
}