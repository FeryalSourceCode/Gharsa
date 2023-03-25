class UserModel {
  String? email;
  String? password;
  String? name;

  UserModel({this.email, this.password, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
