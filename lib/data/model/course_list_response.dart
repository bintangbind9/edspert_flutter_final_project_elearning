import 'course.dart';

class CourseListResponse {
    final int? status;
    final String? message;
    final List<Course>? data;

    CourseListResponse({
        this.status,
        this.message,
        this.data,
    });

    factory CourseListResponse.fromJson(Map<String, dynamic> json) => CourseListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Course>.from(json["data"]!.map((x) => Course.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}