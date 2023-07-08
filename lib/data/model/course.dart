class Course {
    final String? courseId;
    final String? majorName;
    final String? courseCategory;
    final String? courseName;
    final String? urlCover;
    final int? jumlahMateri;
    final int? jumlahDone;
    final int? progress;

    Course({
        this.courseId,
        this.majorName,
        this.courseCategory,
        this.courseName,
        this.urlCover,
        this.jumlahMateri,
        this.jumlahDone,
        this.progress,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseId: json["course_id"],
        majorName: json["major_name"],
        courseCategory: json["course_category"],
        courseName: json["course_name"],
        urlCover: json["url_cover"],
        jumlahMateri: json["jumlah_materi"],
        jumlahDone: json["jumlah_done"],
        progress: json["progress"],
    );

    Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "major_name": majorName,
        "course_category": courseCategory,
        "course_name": courseName,
        "url_cover": urlCover,
        "jumlah_materi": jumlahMateri,
        "jumlah_done": jumlahDone,
        "progress": progress,
    };
}