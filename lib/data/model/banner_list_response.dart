import 'banner.dart';

class BannerListResponse {
    final int? status;
    final String? message;
    final List<Banner>? data;

    BannerListResponse({
        this.status,
        this.message,
        this.data,
    });

    factory BannerListResponse.fromJson(Map<String, dynamic> json) => BannerListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Banner>.from(json["data"]!.map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}