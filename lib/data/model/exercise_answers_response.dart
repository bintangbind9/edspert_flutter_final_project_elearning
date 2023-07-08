class ExerciseAnswersResponse {
  final int? status;
  final String? message;

  ExerciseAnswersResponse({
    this.status,
    this.message,
  });

  factory ExerciseAnswersResponse.fromJson(Map<String, dynamic> json) =>
      ExerciseAnswersResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}