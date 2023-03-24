class UserModel {
  String? email;
  String? password;
  String? name;

  UserModel({this.email, this.password, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
