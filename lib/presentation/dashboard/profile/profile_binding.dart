import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/repository/auth_repository_impl.dart';
import 'package:edspert_flutter_final_project_elearning/data/service/dio_client_impl.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/auth_repository.dart';
import 'package:edspert_flutter_final_project_elearning/domain/service/dio_client.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/auth/get_user_by_email_use_case.dart';
import 'package:get/get.dart';

import '../../../data/service/firebase_auth_service_impl.dart';
import '../../../domain/service/firebase_auth_service.dart';
import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
        authRemoteDataSource: Get.find<AuthRemoteDataSource>()));
    Get.lazyPut<GetUserByEmailUseCase>(
        () => GetUserByEmailUseCase(repository: Get.find<AuthRepository>()));
    Get.lazyPut<ProfileController>(() => ProfileController(
        firebaseAuthService: Get.find<FirebaseAuthService>(),
        getUserByEmailUseCase: Get.find<GetUserByEmailUseCase>()));
  }
}