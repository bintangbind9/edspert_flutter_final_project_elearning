import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';

import '../../../data/model/exercise_answers_request.dart';

class SubmitAnswersUseCase {
  final CourseRepository repository;

  SubmitAnswersUseCase({required this.repository});

  Future<bool> call({required ExerciseAnswersRequest exerciseAnswersRequest}) async {
    return await repository.submitAnswers(exerciseAnswersRequest: exerciseAnswersRequest);
  }
}