import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';

import '../../../data/model/exercise.dart';

class GetExerciseByCourseUseCase {
  final CourseRepository repository;

  GetExerciseByCourseUseCase({required this.repository});

  Future<List<Exercise>> call({required String courseId, required String email}) async {
    return await repository.getExercisesByCourse(courseId: courseId, email: email);
  }
}