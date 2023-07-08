import 'package:edspert_flutter_final_project_elearning/data/model/exercise_answers_response.dart';
import 'package:edspert_flutter_final_project_elearning/domain/service/dio_client.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/urls.dart';
import '../../model/course.dart';
import '../../model/course_list_response.dart';
import '../../model/exercise.dart';
import '../../model/exercise_answers_request.dart';
import '../../model/exercise_list_response.dart';
import '../../model/exercise_result_response.dart';
import '../../model/question.dart';
import '../../model/question_list_response.dart';

class CourseRemoteDataSource {
  final DioClient dioClient;

  CourseRemoteDataSource({required this.dioClient});

  Future<List<Course>> getCourses(
      {required String majorName, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.courseList,
        queryParameters: {
          "major_name": majorName,
          "user_email": email,
        },
      );

      CourseListResponse res = CourseListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getCourses: $e, $stackTrace');
      }
      return [];
    }
  }

  Future<ExerciseResultData?> getExerciseResult(
      {required String exerciseId, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.exerciseResult,
        queryParameters: {
          "exercise_id": exerciseId,
          "user_email": email,
        },
      );

      ExerciseResultResponse res = ExerciseResultResponse.fromJson(result);
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getExerciseResult: $e, $stackTrace');
      }
      return null;
    }
  }

  Future<List<Exercise>> getExercisesByCourse(
      {required String courseId, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.exerciseList,
        queryParameters: {
          "course_id": courseId,
          "user_email": email,
        },
      );

      ExerciseListResponse res = ExerciseListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getExercisesByCourse: $e, $stackTrace');
      }
      return [];
    }
  }

  Future<List<Question>> getQuestions(
      {required String exerciseId, required String email}) async {
    try {
      final result = await dioClient.post(
        Urls.exerciseQuestionsList,
        body: {
          "exercise_id": exerciseId,
          "user_email": email,
        },
      );

      QuestionListResponse res = QuestionListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getQuestions: $e, $stackTrace');
      }
      return [];
    }
  }

  Future<bool> submitAnswers(
      {required ExerciseAnswersRequest exerciseAnswersRequest}) async {
    try {
      final result = await dioClient.post(
        Urls.submitExerciseAnswers,
        body: exerciseAnswersRequest.toJson(),
      );

      ExerciseAnswersResponse res = ExerciseAnswersResponse.fromJson(result);
      if ((res.status ?? 0) == 0) {
        return false;
      }
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err submitAnswers: $e, $stackTrace');
      }
      return false;
    }
  }
}