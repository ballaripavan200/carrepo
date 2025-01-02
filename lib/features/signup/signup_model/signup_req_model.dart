class SignupReqModel {
  String? name;
  String? email;
  String? password;

  SignupReqModel({this.name, this.email, this.password});

  SignupReqModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}