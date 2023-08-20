import 'package:edspert_flutter_final_project_elearning/domain/use_case/firestore/get_user_group_stream_use_case.dart';
import 'package:get/get.dart';

class GroupListController extends GetxController {
  final GetUserGroupStreamUseCase getUserGroupStreamUseCase;

  GroupListController({required this.getUserGroupStreamUseCase});

  Rx<bool> isLoadingGroups = false.obs;

  final Rx<List<dynamic>> _groups = Rx<List<dynamic>>([]);

  List<dynamic> get groups => _groups.value;

  @override
  void onInit() {
    retrieveGroups();
    super.onInit();
  }

  void retrieveGroups() {
    _groups.bindStream(getUserGroupStreamUseCase.call());
  }
}