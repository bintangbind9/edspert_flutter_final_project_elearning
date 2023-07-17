import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/repository/auth_repository_impl.dart';
import 'package:edspert_flutter_final_project_elearning/data/service/dio_client_impl.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/auth_repository.dart';
import 'package:edspert_flutter_final_project_elearning/domain/service/dio_client.dart';
import 'package:get/get.dart';

import '../../../../domain/use_case/auth/update_user_by_email_use_case.dart';
import 'profile_edit_controller.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
        authRemoteDataSource: Get.find<AuthRemoteDataSource>()));
    Get.lazyPut<UpdateUserByEmailUseCase>(
        () => UpdateUserByEmailUseCase(repository: Get.find<AuthRepository>()));
    Get.put(ProfileEditController(
        updateUserByEmailUseCase: Get.find<UpdateUserByEmailUseCase>()));
  }
}