class LoginResModel {
  String? token;
  bool? error;
  Student? student;

  LoginResModel({this.token, this.error, this.student});

  LoginResModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    error = json['error'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['error'] = error;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Student {
  String? id;
  String? name;
  String? email;

  Student({this.id, this.name, this.email});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}