class User {
    final String? iduser;
    final String? userName;
    final String? userEmail;
    final String? userFoto;
    final String? userAsalSekolah;
    final DateTime? dateCreate;
    final String? jenjang;
    final String? userGender;
    final String? userStatus;
    final String? kelas;

    User({
        this.iduser,
        this.userName,
        this.userEmail,
        this.userFoto,
        this.userAsalSekolah,
        this.dateCreate,
        this.jenjang,
        this.userGender,
        this.userStatus,
        this.kelas,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        iduser: json["iduser"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userFoto: json["user_foto"],
        userAsalSekolah: json["user_asal_sekolah"],
        dateCreate: json["date_create"] == null ? null : DateTime.parse(json["date_create"]),
        jenjang: json["jenjang"],
        userGender: json["user_gender"],
        userStatus: json["user_status"],
        kelas: json["kelas"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "user_name": userName,
        "user_email": userEmail,
        "user_foto": userFoto,
        "user_asal_sekolah": userAsalSekolah,
        "date_create": dateCreate?.toIso8601String(),
        "jenjang": jenjang,
        "user_gender": userGender,
        "user_status": userStatus,
        "kelas": kelas,
    };
}