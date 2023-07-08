import 'package:edspert_flutter_final_project_elearning/data/data_source/remote_data_source/course_remote_data_source.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/course.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/exercise.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/exercise_answers_request.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/exercise_result_response.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/question.dart';
import 'package:edspert_flutter_final_project_elearning/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;

  CourseRepositoryImpl({required this.courseRemoteDataSource});

  @override
  Future<List<Course>> getCourses({required String majorName, required String email}) async {
    return await courseRemoteDataSource.getCourses(majorName: majorName, email: email);
  }

  @override
  Future<ExerciseResultData?> getExerciseResult({required String exerciseId, required String email}) async {
    return await courseRemoteDataSource.getExerciseResult(exerciseId: exerciseId, email: email);
  }

  @override
  Future<List<Exercise>> getExercisesByCourse({required String courseId, required String email}) async {
    return await courseRemoteDataSource.getExercisesByCourse(courseId: courseId, email: email);
  }

  @override
  Future<List<Question>> getQuestions({required String exerciseId, required String email}) async {
    return await courseRemoteDataSource.getQuestions(exerciseId: exerciseId, email: email);
  }

  @override
  Future<bool> submitAnswers({required ExerciseAnswersRequest exerciseAnswersRequest}) async {
    return await courseRemoteDataSource.submitAnswers(exerciseAnswersRequest: exerciseAnswersRequest);
  }
}