import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_courses_use_case.dart';
import 'package:get/get.dart';

import '../../../data/model/course.dart';
import '../../../domain/service/firebase_auth_service.dart';

class CourseListController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetCoursesUseCase getCoursesUseCase;

  CourseListController(
      {required this.firebaseAuthService, required this.getCoursesUseCase});

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getCourses();
    });
  }

  List<Course> courseList = [];

  Future<void> getCourses() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<Course> result = await getCoursesUseCase.call(
        majorName: GeneralValues.majorName,
        email: email,
      );
      courseList = result;
      update();
    }
  }
}
