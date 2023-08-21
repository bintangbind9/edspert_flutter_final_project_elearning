import 'package:edspert_flutter_final_project_elearning/core/utils/time_ago.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/firestore/group.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/firestore/get_groups_stream_use_case.dart';
import 'package:get/get.dart';

class GroupListController extends GetxController {
  final GetGroupsStreamUseCase getGroupsStreamUseCase;
  final TimeAgo timeAgo;

  GroupListController({required this.getGroupsStreamUseCase, required this.timeAgo});

  Rx<bool> isLoadingGroups = false.obs;

  final Rx<List<GroupModel>> _groups = Rx<List<GroupModel>>([]);

  List<GroupModel> get groups => _groups.value;

  @override
  void onInit() {
    retrieveGroups();
    super.onInit();
  }

  void retrieveGroups() {
    _groups.bindStream(getGroupsStreamUseCase.call());
  }
}