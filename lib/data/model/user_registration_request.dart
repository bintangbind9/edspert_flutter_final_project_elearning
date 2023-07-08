class UserRegistrationRequest {
  final String email;
  final String fullName;
  final String gender;
  final String schoolName;
  final String schoolLevel;
  final String schoolGrade;
  final String? photoUrl;

  UserRegistrationRequest({
    required this.email,
    required this.fullName,
    required this.gender,
    required this.schoolName,
    required this.schoolLevel,
    required this.schoolGrade,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nama_lengkap': fullName,
      'gender': gender,
      'nama_sekolah': schoolName,
      'jenjang': schoolLevel,
      'kelas': schoolGrade,
      'foto': photoUrl,
    };
  }

  factory UserRegistrationRequest.fromMap(Map<String, dynamic> map) {
    return UserRegistrationRequest(
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      gender: map['gender'] as String,
      schoolName: map['schoolName'] as String,
      schoolLevel: map['schoolLevel'] as String,
      schoolGrade: map['schoolGrade'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }
}