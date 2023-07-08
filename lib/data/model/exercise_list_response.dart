import 'exercise.dart';

class ExerciseListResponse {
    final int? status;
    final String? message;
    final List<Exercise>? data;

    ExerciseListResponse({
        this.status,
        this.message,
        this.data,
    });

    factory ExerciseListResponse.fromJson(Map<String, dynamic> json) => ExerciseListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Exercise>.from(json["data"]!.map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}