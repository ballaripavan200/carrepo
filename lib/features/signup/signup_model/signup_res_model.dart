class SignupResModel{
  String? message;
  bool? error;

  SignupResModel({this.message, this.error});

  SignupResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}