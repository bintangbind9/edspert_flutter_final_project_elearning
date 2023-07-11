import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/banner/get_banners_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_courses_use_case.dart';
import 'package:get/get.dart';

import '../../../data/model/course.dart';
import '../../../domain/service/firebase_auth_service.dart';

class HomeController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetCoursesUseCase getCoursesUseCase;
  final GetBannersUseCase getBannersUseCase;

  HomeController(
      {required this.firebaseAuthService, required this.getCoursesUseCase, required this.getBannersUseCase});

  List<Course> courseList = [];
  bool isGetCoursesLoading = false;

  /*
  @override
  void onInit() {
    super.onInit();
  }
  */

  Future<void> getCourses() async {
    // Set Loading
    isGetCoursesLoading = true;
    update();
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<Course> result = await getCoursesUseCase.call(
        majorName: GeneralValues.majorName,
        email: email,
      );
      isGetCoursesLoading = false;
      courseList = result;
      update();
    }
  }
}
