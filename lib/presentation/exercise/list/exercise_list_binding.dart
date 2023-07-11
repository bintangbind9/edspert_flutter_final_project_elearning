import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/course_remote_data_source.dart';
import 'package:get/get.dart';

import '../../../data/repository/course_repository_impl.dart';
import '../../../data/service/dio_client_impl.dart';
import '../../../data/service/firebase_auth_service_impl.dart';
import '../../../domain/repository/course_repository.dart';
import '../../../domain/service/dio_client.dart';
import '../../../domain/service/firebase_auth_service.dart';
import '../../../domain/use_case/course/get_exercise_by_course_use_case.dart';
import 'exercise_list_controller.dart';

class ExerciseListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRemoteDataSource>(() => CourseRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(courseRemoteDataSource: Get.find<CourseRemoteDataSource>()));
    Get.lazyPut<GetExerciseByCourseUseCase>(() => GetExerciseByCourseUseCase(repository: Get.find<CourseRepository>()));
    Get.lazyPut(() => ExerciseListController(getExerciseByCourseUseCase: Get.find<GetExerciseByCourseUseCase>(), firebaseAuthService: Get.find<FirebaseAuthService>()));
  }
}