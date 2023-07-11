import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/banner_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/course_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/auth/get_user_by_email_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/banner/get_banners_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_courses_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/auth/login/login_controller.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/home/home_controller.dart';
import 'package:get/get.dart';

import '../../data/repository/auth_repository_impl.dart';
import '../../data/repository/banner_repository_impl.dart';
import '../../data/repository/course_repository_impl.dart';
import '../../data/service/dio_client_impl.dart';
import '../../data/service/firebase_auth_service_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/banner_repository.dart';
import '../../domain/service/dio_client.dart';
import '../../domain/service/firebase_auth_service.dart';
import 'dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: Get.find<AuthRemoteDataSource>()));
    Get.lazyPut<GetUserByEmailUseCase>(() => GetUserByEmailUseCase(repository: Get.find<AuthRepository>()));
    Get.lazyPut<CourseRemoteDataSource>(() => CourseRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(courseRemoteDataSource: Get.find<CourseRemoteDataSource>()));
    Get.lazyPut<GetCoursesUseCase>(() => GetCoursesUseCase(repository: Get.find<CourseRepository>()));
    Get.lazyPut<BannerRemoteDataSource>(() => BannerRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<BannerRepository>(() => BannerRepositoryImpl(bannerRemoteDataSource: Get.find<BannerRemoteDataSource>()));
    Get.lazyPut<GetBannersUseCase>(() => GetBannersUseCase(repository: Get.find<BannerRepository>()));
    Get.lazyPut(() => LoginController(firebaseAuthService: Get.find<FirebaseAuthService>(), getUserByEmailUseCase: Get.find<GetUserByEmailUseCase>()));
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController(firebaseAuthService: Get.find<FirebaseAuthService>(), getCoursesUseCase: Get.find<GetCoursesUseCase>(), getBannersUseCase: Get.find<GetBannersUseCase>()));
  }
}