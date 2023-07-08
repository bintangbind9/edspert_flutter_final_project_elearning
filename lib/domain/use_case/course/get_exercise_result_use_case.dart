import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';

import '../../../data/model/exercise_result_response.dart';

class GetExerciseResultUseCase {
  final CourseRepository repository;

  GetExerciseResultUseCase({required this.repository});

  Future<ExerciseResultData?> call({required String exerciseId, required String email}) async {
    return await repository.getExerciseResult(exerciseId: exerciseId, email: email);
  }
}