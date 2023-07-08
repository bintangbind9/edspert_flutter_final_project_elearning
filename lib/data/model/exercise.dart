class Exercise {
    final String? exerciseId;
    final String? exerciseCode;
    final String? fileCourse;
    final String? icon;
    final String? exerciseTitle;
    final String? exerciseDescription;
    final String? exerciseInstruction;
    final String? countQuestion;
    final String? classFk;
    final String? courseFk;
    final String? courseContentFk;
    final String? subCourseContentFk;
    final String? creatorId;
    final String? creatorName;
    final String? examFrom;
    final String? accessType;
    final String? exerciseOrder;
    final String? exerciseStatus;
    final String? exerciseUserStatus;
    final String? jumlahSoal;
    final int? jumlahDone;
    final DateTime? dateCreate;
    final DateTime? dateUpdate;

    Exercise({
        this.exerciseId,
        this.exerciseCode,
        this.fileCourse,
        this.icon,
        this.exerciseTitle,
        this.exerciseDescription,
        this.exerciseInstruction,
        this.countQuestion,
        this.classFk,
        this.courseFk,
        this.courseContentFk,
        this.subCourseContentFk,
        this.creatorId,
        this.creatorName,
        this.examFrom,
        this.accessType,
        this.exerciseOrder,
        this.exerciseStatus,
        this.exerciseUserStatus,
        this.jumlahSoal,
        this.jumlahDone,
        this.dateCreate,
        this.dateUpdate,
    });

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        exerciseId: json["exercise_id"],
        exerciseCode: json["exercise_code"],
        fileCourse: json["file_course"],
        icon: json["icon"],
        exerciseTitle: json["exercise_title"],
        exerciseDescription: json["exercise_description"],
        exerciseInstruction: json["exercise_instruction"],
        countQuestion: json["count_question"],
        classFk: json["class_fk"],
        courseFk: json["course_fk"],
        courseContentFk: json["course_content_fk"],
        subCourseContentFk: json["sub_course_content_fk"],
        creatorId: json["creator_id"],
        creatorName: json["creator_name"],
        examFrom: json["exam_from"],
        accessType: json["access_type"],
        exerciseOrder: json["exercise_order"],
        exerciseStatus: json["exercise_status"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
        dateCreate: json["date_create"] == null ? null : DateTime.parse(json["date_create"]),
        dateUpdate: json["date_update"] == null ? null : DateTime.parse(json["date_update"]),
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_code": exerciseCode,
        "file_course": fileCourse,
        "icon": icon,
        "exercise_title": exerciseTitle,
        "exercise_description": exerciseDescription,
        "exercise_instruction": exerciseInstruction,
        "count_question": countQuestion,
        "class_fk": classFk,
        "course_fk": courseFk,
        "course_content_fk": courseContentFk,
        "sub_course_content_fk": subCourseContentFk,
        "creator_id": creatorId,
        "creator_name": creatorName,
        "exam_from": examFrom,
        "access_type": accessType,
        "exercise_order": exerciseOrder,
        "exercise_status": exerciseStatus,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
        "date_create": dateCreate?.toIso8601String(),
        "date_update": dateUpdate?.toIso8601String(),
    };
}