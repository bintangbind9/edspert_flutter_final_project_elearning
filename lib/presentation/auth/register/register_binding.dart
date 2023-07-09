import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/auth/register_user_use_case.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../data/repository/auth_repository_impl.dart';
import '../../../data/service/dio_client_impl.dart';
import '../../../data/service/firebase_auth_service_impl.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../domain/service/dio_client.dart';
import '../../../domain/service/firebase_auth_service.dart';
import 'register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
        authRemoteDataSource: Get.find<AuthRemoteDataSource>()));
    Get.lazyPut<RegisterUserUseCase>(
        () => RegisterUserUseCase(repository: Get.find<AuthRepository>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut(() => RegisterController(
        registerUserUseCase: Get.find<RegisterUserUseCase>(),
        firebaseAuthService: Get.find<FirebaseAuthService>()));
  }
}
