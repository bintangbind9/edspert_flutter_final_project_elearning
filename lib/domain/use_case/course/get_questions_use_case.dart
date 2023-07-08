import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';

import '../../../data/model/question.dart';

class GetQuestionsUseCase {
  final CourseRepository repository;

  GetQuestionsUseCase({required this.repository});

  Future<List<Question>> call({required String exerciseId, required String email}) async {
    return await repository.getQuestions(exerciseId: exerciseId, email: email);
  }
}