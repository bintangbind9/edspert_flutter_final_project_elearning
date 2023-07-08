class ExerciseAnswersRequest {
    final String userEmail;
    final String exerciseId;
    final List<String> bankQuestionId;
    final List<String> studentAnswer;

    ExerciseAnswersRequest({
        required this.userEmail,
        required this.exerciseId,
        required this.bankQuestionId,
        required this.studentAnswer,
    });

    factory ExerciseAnswersRequest.fromJson(Map<String, dynamic> json) => ExerciseAnswersRequest(
        userEmail: json["user_email"],
        exerciseId: json["exercise_id"],
        bankQuestionId: List<String>.from(json["bank_question_id"].map((x) => x)),
        studentAnswer: List<String>.from(json["student_answer"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "exercise_id": exerciseId,
        "bank_question_id": List<String>.from(bankQuestionId.map((x) => x)),
        "student_answer": List<String>.from(studentAnswer.map((x) => x)),
    };
}