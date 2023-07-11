class Question {
    final String? exerciseId;
    final String? questionId;
    final String? questionTitle;
    final String? questionTitleImg;
    final String? optionA;
    final String? optionAImg;
    final String? optionB;
    final String? optionBImg;
    final String? optionC;
    final String? optionCImg;
    final String? optionD;
    final String? optionDImg;
    final String? optionE;
    final String? optionEImg;
    final String? studentAnswer;

    Question({
        this.exerciseId,
        this.questionId,
        this.questionTitle,
        this.questionTitleImg,
        this.optionA,
        this.optionAImg,
        this.optionB,
        this.optionBImg,
        this.optionC,
        this.optionCImg,
        this.optionD,
        this.optionDImg,
        this.optionE,
        this.optionEImg,
        this.studentAnswer,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        exerciseId: json["exercise_id_fk"],
        questionId: json["bank_question_id"],
        questionTitle: json["question_title"],
        questionTitleImg: json["question_title_img"],
        optionA: json["option_a"],
        optionAImg: json["option_a_img"],
        optionB: json["option_b"],
        optionBImg: json["option_b_img"],
        optionC: json["option_c"],
        optionCImg: json["option_c_img"],
        optionD: json["option_d"],
        optionDImg: json["option_d_img"],
        optionE: json["option_e"],
        optionEImg: json["option_e_img"],
        studentAnswer: json["student_answer"],
    );

    Map<String, dynamic> toJson() => {
        "exercise_id_fk": exerciseId,
        "bank_question_id": questionId,
        "question_title": questionTitle,
        "question_title_img": questionTitleImg,
        "option_a": optionA,
        "option_a_img": optionAImg,
        "option_b": optionB,
        "option_b_img": optionBImg,
        "option_c": optionC,
        "option_c_img": optionCImg,
        "option_d": optionD,
        "option_d_img": optionDImg,
        "option_e": optionE,
        "option_e_img": optionEImg,
        "student_answer": studentAnswer,
    };
}