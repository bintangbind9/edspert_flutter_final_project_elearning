import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_exercise_by_course_use_case.dart';
import 'package:get/get.dart';

import '../../../data/model/exercise.dart';
import '../../../domain/service/firebase_auth_service.dart';
import 'exercise_list_page.dart';

class ExerciseListController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetExerciseByCourseUseCase getExerciseByCourseUseCase;

  ExerciseListController({required this.getExerciseByCourseUseCase, required this.firebaseAuthService});

  late String courseId;
  late String courseName;

  @override
  void onInit() {
    super.onInit();

    ExerciseListPageArgs args = Get.arguments as ExerciseListPageArgs;
    courseId = args.courseId;
    courseName = args.courseName;

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getExercises();
    });
  }

  List<Exercise> exerciseList = [];
  bool isExerciseListLoading = false;

  Future<void> getExercises() async {
    isExerciseListLoading = true;
    update();

    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<Exercise> result = await getExerciseByCourseUseCase.call(
        courseId: courseId,
        email: email,
      );
      exerciseList = result;
      isExerciseListLoading = false;
      update();
    } else {
      isExerciseListLoading = false;
      update();
    }
  }
}