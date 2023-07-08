import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';

import '../../../data/model/course.dart';

class GetCoursesUseCase {
  final CourseRepository repository;

  GetCoursesUseCase({required this.repository});

  Future<List<Course>> call({required String majorName, required String email}) async {
    return await repository.getCourses(majorName: majorName, email: email);
  }
}