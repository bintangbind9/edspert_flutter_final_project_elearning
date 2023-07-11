import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/course_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/repository/course_repository_impl.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_courses_use_case.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../data/service/dio_client_impl.dart';
import '../../../data/service/firebase_auth_service_impl.dart';
import '../../../domain/service/dio_client.dart';
import '../../../domain/service/firebase_auth_service.dart';
import 'course_list_controller.dart';

class CourseListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<CourseRemoteDataSource>(() => CourseRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(courseRemoteDataSource: Get.find<CourseRemoteDataSource>()));
    Get.lazyPut<GetCoursesUseCase>(() => GetCoursesUseCase(repository: Get.find<CourseRepository>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut(() => CourseListController(firebaseAuthService: Get.find<FirebaseAuthService>(), getCoursesUseCase: Get.find<GetCoursesUseCase>()));
  }
}