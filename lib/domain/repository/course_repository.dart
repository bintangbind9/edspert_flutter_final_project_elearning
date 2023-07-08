import '../../data/model/course.dart';
import '../../data/model/exercise.dart';
import '../../data/model/exercise_answers_request.dart';
import '../../data/model/exercise_result_response.dart';
import '../../data/model/question.dart';

abstract class CourseRepository {
  Future<List<Course>> getCourses(
      {required String majorName, required String email});
  Future<ExerciseResultData?> getExerciseResult(
      {required String exerciseId, required String email});
  Future<List<Exercise>> getExercisesByCourse(
      {required String courseId, required String email});
  Future<List<Question>> getQuestions(
      {required String exerciseId, required String email});
  Future<bool> submitAnswers(
      {required ExerciseAnswersRequest exerciseAnswersRequest});
}