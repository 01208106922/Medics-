class UserModel {
  String uid;
  String name;
  String email;
  String password;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] ?? "",
        name = json['name'] ?? "",
        email = json['email'] ?? "",
        password = json['password'] ?? "";

  Map<String, dynamic> toJson() {
    return {
      "uid": uid.isNotEmpty ? uid : null,
      "name": name.isNotEmpty ? name : null,
      "email": email.isNotEmpty ? email : null,
      "password": password.isNotEmpty ? password : null,
    };
  }
}
