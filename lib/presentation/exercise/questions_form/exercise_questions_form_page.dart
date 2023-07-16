import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/model/question.dart';
import 'exercise_questions_form_controller.dart';

class ExerciseQuestionsFormPage extends StatelessWidget {
  const ExerciseQuestionsFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscaleBackground,
      appBar: AppBar(
        title: const Text('Latihan Soal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.grayscaleOffWhite,
        centerTitle: true,
      ),
      body: GetBuilder<ExerciseQuestionsFormController>(
        builder: (controller) {
          List<Question> questions = controller.questionList;
          int activeQuestionIndex = controller.activeQuestionIndex;
          if (questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          Question activeQuestion = questions[activeQuestionIndex];
          String activeQuestionId = controller.activeQuestionId;
          String? selectedAnswer = controller.questionAnswers
              .firstWhereOrNull((e) => e.questionId == activeQuestionId)
              ?.answer;

          print(
              'questionAnswers: ${controller.questionAnswers.map((e) => '${e.questionId}-${e.answer}')}');

          return Column(
            children: [
              // Question Number Horizontal ListView
              Container(
                height: 50,
                color: AppColors.grayscaleOffWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    10,
                    (index) {
                      bool isCurrentQuestion = controller.questionAnswers.any(
                        (element) =>
                            element.questionId == questions[index].questionId &&
                            element.questionId == activeQuestionId,
                      );
                      bool isAnswered = controller.questionAnswers.any(
                          (element) =>
                              element.questionId ==
                                  questions[index].questionId &&
                              element.answer != GeneralValues.defaultAnswer);

                      return InkWell(
                        onTap: () {
                          controller.navigateToQuestionIndex(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isCurrentQuestion
                                  ? AppColors.primary
                                  : (isAnswered
                                      ? AppColors.success
                                      : AppColors.primary),
                            ),
                            color: isCurrentQuestion
                                ? AppColors.primary
                                : (isAnswered
                                    ? AppColors.success
                                    : AppColors.grayscaleOffWhite),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: isCurrentQuestion
                                    ? AppColors.grayscaleOffWhite
                                    : (isAnswered
                                        ? AppColors.grayscaleOffWhite
                                        : AppColors.grayscaleBody),
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(18),
                  children: [
                    Text('Soal Nomor ${activeQuestionIndex + 1}',
                        style: const TextStyle(color: Color(0xFF979797))),
                    const SizedBox(height: 7),
                    // Judul/Pertanyaan Soal
                    HtmlWidget(activeQuestion.questionTitle ?? ''),
                    const SizedBox(height: 26),
                    const Text('Pilih Jawaban:',
                        style: TextStyle(color: Color(0xFF979797))),
                    const SizedBox(height: 12),
                    // Opsi Jawaban
                    InkWell(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestionId,
                          answer: 'A',
                        );
                      },
                      child: AnswerOptionWidget(
                        selectedAnswer: selectedAnswer,
                        textAnswer: activeQuestion.optionA ?? '',
                        labelAnswer: 'A',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestionId,
                          answer: 'B',
                        );
                      },
                      child: AnswerOptionWidget(
                        selectedAnswer: selectedAnswer,
                        textAnswer: activeQuestion.optionB ?? '',
                        labelAnswer: 'B',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestionId,
                          answer: 'C',
                        );
                      },
                      child: AnswerOptionWidget(
                        selectedAnswer: selectedAnswer,
                        textAnswer: activeQuestion.optionC ?? '',
                        labelAnswer: 'C',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestionId,
                          answer: 'D',
                        );
                      },
                      child: AnswerOptionWidget(
                        selectedAnswer: selectedAnswer,
                        textAnswer: activeQuestion.optionD ?? '',
                        labelAnswer: 'D',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestionId,
                          answer: 'E',
                        );
                      },
                      child: AnswerOptionWidget(
                        selectedAnswer: selectedAnswer,
                        textAnswer: activeQuestion.optionE ?? '',
                        labelAnswer: 'E',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonButton(
                            onPressed: activeQuestionIndex > 0
                                ? () {
                                    controller.navigateToQuestionIndex(
                                        activeQuestionIndex - 1);
                                  }
                                : null,
                            text: 'Sebelumnya',
                            textColor: AppColors.primary,
                            backgroundColor: AppColors.grayscaleOffWhite,
                            borderColor: AppColors.primary),
                        if (activeQuestionIndex < questions.length - 1)
                          CommonButton(
                            onPressed: () {
                              controller.navigateToQuestionIndex(
                                  activeQuestionIndex + 1);
                            },
                            text: 'Selanjutnya',
                          )
                        else
                          CommonButton(
                            onPressed: () {
                              Get.bottomSheet(
                                Wrap(
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(height: 16),
                                        const Text(
                                            'Kumpulkan latihan soal sekarang?'),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            const SizedBox(width: 32),
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text('Nanti Dulu'),
                                              ),
                                            ),
                                            const SizedBox(width: 32),
                                            Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    controller.submitAnswers();
                                                  },
                                                  child: const Text('Ya')),
                                            ),
                                            const SizedBox(width: 32),
                                          ],
                                        ),
                                        const SizedBox(height: 32),
                                      ],
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                              );
                            },
                            text: 'Kumpulin',
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnswerOptionWidget extends StatelessWidget {
  const AnswerOptionWidget(
      {super.key,
      required this.selectedAnswer,
      required this.textAnswer,
      required this.labelAnswer});

  final String? selectedAnswer;
  final String textAnswer;
  final String labelAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: selectedAnswer == labelAnswer ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFC9C9C9),
            width: 1,
          ),
        ),
        child: HtmlWidget(
          textAnswer,
          textStyle: TextStyle(
              color: selectedAnswer == labelAnswer
                  ? AppColors.grayscaleOffWhite
                  : AppColors.grayscaleBody),
        ));
  }
}