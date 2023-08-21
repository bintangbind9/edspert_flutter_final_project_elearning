import 'package:edspert_flutter_final_project_elearning/core/utils/time_ago.dart';
import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/firestore_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/repository/firestore_repository_impl.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/firestore_repository.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/firestore/get_groups_stream_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/discussion/group_list_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GroupListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FirestoreRemoteDataSource>(FirestoreRemoteDataSource(uid: FirebaseAuth.instance.currentUser!.uid));
    Get.put<FirestoreRepository>(FirestoreRepositoryImpl(firestoreRemoteDataSource: Get.find<FirestoreRemoteDataSource>()));
    Get.put<GetGroupsStreamUseCase>(GetGroupsStreamUseCase(firestoreRepository: Get.find<FirestoreRepository>()));
    Get.put<TimeAgo>(TimeAgo());
    Get.put(GroupListController(getGroupsStreamUseCase: Get.find<GetGroupsStreamUseCase>(), timeAgo: Get.find<TimeAgo>()));
  }
}