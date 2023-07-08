import 'user.dart';

class UserResponse {
    final int? status;
    final String? message;
    final User? data;

    UserResponse({
        this.status,
        this.message,
        this.data,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : User.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}