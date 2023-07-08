import 'question.dart';

class QuestionListResponse {
    final int? status;
    final String? message;
    final List<Question>? data;

    QuestionListResponse({
        this.status,
        this.message,
        this.data,
    });

    factory QuestionListResponse.fromJson(Map<String, dynamic> json) => QuestionListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Question>.from(json["data"]!.map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}