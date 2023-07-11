import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/course_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_questions_use_case.dart';
import 'package:get/get.dart';

import '../../../data/repository/course_repository_impl.dart';
import '../../../data/service/dio_client_impl.dart';
import '../../../data/service/firebase_auth_service_impl.dart';
import '../../../domain/repository/course_repository.dart';
import '../../../domain/service/dio_client.dart';
import '../../../domain/service/firebase_auth_service.dart';
import '../../../domain/use_case/course/get_exercise_result_use_case.dart';
import '../../../domain/use_case/course/submit_answers_use_case.dart';
import 'exercise_questions_form_controller.dart';

class ExerciseQuestionsFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRemoteDataSource>(
        () => CourseRemoteDataSource(dioClient: Get.find<DioClient>()));
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(
        courseRemoteDataSource: Get.find<CourseRemoteDataSource>()));
    Get.lazyPut<GetQuestionsUseCase>(
        () => GetQuestionsUseCase(repository: Get.find<CourseRepository>()));
    Get.lazyPut<SubmitAnswersUseCase>(
        () => SubmitAnswersUseCase(repository: Get.find<CourseRepository>()));
    Get.lazyPut<GetExerciseResultUseCase>(() =>
        GetExerciseResultUseCase(repository: Get.find<CourseRepository>()));
    Get.lazyPut(() => ExerciseQuestionsFormController(
        firebaseAuthService: Get.find<FirebaseAuthService>(),
        getQuestionsUseCase: Get.find<GetQuestionsUseCase>(),
        submitAnswersUseCase: Get.find<SubmitAnswersUseCase>(),
        getExerciseResultUseCase: Get.find<GetExerciseResultUseCase>()));
  }
}
