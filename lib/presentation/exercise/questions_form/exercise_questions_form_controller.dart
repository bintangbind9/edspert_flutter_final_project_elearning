import 'package:edspert_flutter_final_project_elearning/core/constants/constants.dart';
import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/data/model/exercise_answers_request.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_exercise_result_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/get_questions_use_case.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/course/submit_answers_use_case.dart';
import 'package:get/get.dart';

import '../../../data/model/exercise_result_response.dart';
import '../../../data/model/question.dart';
import '../../../data/model/question_answer.dart';
import '../../../domain/service/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class ExerciseQuestionsFormController extends GetxController {
  final GetQuestionsUseCase getQuestionsUseCase;
  final SubmitAnswersUseCase submitAnswersUseCase;
  final GetExerciseResultUseCase getExerciseResultUseCase;
  final FirebaseAuthService firebaseAuthService;

  ExerciseQuestionsFormController(
      {required this.firebaseAuthService,
      required this.getQuestionsUseCase,
      required this.submitAnswersUseCase,
      required this.getExerciseResultUseCase});

  // Currently set to static
  late String exerciseId;

  @override
  void onInit() {
    super.onInit();

    exerciseId = Get.arguments as String;
    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getQuestions();
    });
  }

  /// Questions
  List<Question> questionList = [];

  /// Get Dari API Get Questions
  Future<void> getQuestions() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<Question> result =
          await getQuestionsUseCase.call(exerciseId: exerciseId, email: email);
      questionList = result;
      if (questionList.isNotEmpty) {
        // Init jawaban yang sudah diisi
        _initStudentAnsweredQuestions();

        // Set soal aktif ke nomor 1
        activeQuestionId = questionList.first.questionId!;
      }
      update();
    }
  }

  void _initStudentAnsweredQuestions() {
    for (Question data in questionList) {
      if (data.studentAnswer != null) {
        if (questionAnswers
            .any((element) => element.questionId == data.questionId)) {
          int indexToUpdate = questionAnswers
              .indexWhere((element) => element.questionId == data.questionId);
          questionAnswers[indexToUpdate] = QuestionAnswer(
              questionId: data.questionId!, answer: data.studentAnswer!);
        } else {
          questionAnswers.add(QuestionAnswer(
              questionId: data.questionId!, answer: data.studentAnswer!));
        }
        update();
      }
    }
  }

  /// Answers
  List<QuestionAnswer> questionAnswers = List.empty(growable: true);
  int activeQuestionIndex = 0;
  String activeQuestionId = '';
  bool submitAnswerLoading = false;

  void navigateToQuestionIndex(int index) {
    activeQuestionIndex = index;
    try {
      activeQuestionId = questionList[activeQuestionIndex].questionId ?? '';
    } catch (e) {
      // Ignore
    }
    update();
  }

  void updateAnswerToQuestion(
      {required String questionId, required String answer}) {
    if (questionAnswers.any((element) => element.questionId == questionId)) {
      int indexToUpdate = questionAnswers
          .indexWhere((element) => element.questionId == questionId);
      questionAnswers[indexToUpdate] =
          QuestionAnswer(questionId: questionId, answer: answer);
    } else {
      print('question: $questionId');
      questionAnswers
          .add(QuestionAnswer(questionId: questionId, answer: answer));
    }
    update();
  }

  Future<void> submitAnswers() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      submitAnswerLoading = true;
      update();

      if (!questionAnswers.any((element) => element.answer == GeneralValues.defaultAnswer)) {
        List<String> questionIds =
            questionAnswers.map((e) => e.questionId).toList();
        List<String> answers = questionAnswers.map((e) => e.answer).toList();

        /// Submit Answer API Call
        bool submitAnswersResult = await submitAnswersUseCase.call(
            exerciseAnswersRequest: ExerciseAnswersRequest(
                userEmail: email,
                exerciseId: exerciseId,
                bankQuestionId: questionIds,
                studentAnswer: answers));

        if (submitAnswersResult == true) {
          /// Get Exercise Result API Call
          ExerciseResultData? exerciseResult = await getExerciseResultUseCase
              .call(exerciseId: exerciseId, email: email);
          if (exerciseResult != null) {
            Get.offNamed(Routes.exerciseResult,
                arguments: exerciseResult.result?.jumlahScore ?? "0");
          }
        }
        submitAnswerLoading = false;
        update();
      } else {
        Get.snackbar('Semua harus diisi!', 'Periksa kembali jawaban anda.', backgroundColor: AppColors.warning);
      }
    }
  }
}