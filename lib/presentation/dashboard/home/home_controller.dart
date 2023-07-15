import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/banner/get_banners_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_courses_use_case.dart';
import 'package:get/get.dart';

import '../../../data/model/banner.dart';
import '../../../data/model/course.dart';
import '../../../data/model/user.dart';
import '../../../domain/service/firebase_auth_service.dart';
import '../../../domain/use_case/auth/get_user_by_email_use_case.dart';

class HomeController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final GetCoursesUseCase getCoursesUseCase;
  final GetBannersUseCase getBannersUseCase;
  final GetUserByEmailUseCase getUserByEmailUseCase;

  HomeController(
      {required this.firebaseAuthService,
      required this.getCoursesUseCase,
      required this.getBannersUseCase,
      required this.getUserByEmailUseCase});

  List<Course> courseList = [];
  List<Banner> bannerList = [];
  bool isHomeLoading = false;
  Rx<User> currentUser = (User()).obs;

  /*
  @override
  void onInit() {
    super.onInit();
  }
  */

  Future<void> getHomeDatas() async {
    // Set Loading
    isHomeLoading = true;
    update();
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      User? user = await getUserByEmailUseCase.call(email: email);
      if (user != null) {
        currentUser(user);
      }

      List<Course> coursesResult = await getCoursesUseCase.call(
        majorName: GeneralValues.majorName,
        email: email,
      );
      courseList = coursesResult;

      List<Banner> bannersResult =
          await getBannersUseCase.call(limit: GeneralValues.maxHomeCourseCount);
      bannerList = bannersResult;

      isHomeLoading = false;
      update();
    }
  }
}