class UserModel {
  final String uid;
  final String email;
  final List<dynamic> groups;

  UserModel({required this.uid, required this.email, required this.groups});

  UserModel.fromJson(Map<String, Object?> json)
    : this(
        uid: json['uid']! as String,
        email: json['email']! as String,
        groups: json['groups']! as List<dynamic>
      );

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'email': email,
      'groups': groups
    };
  }
}