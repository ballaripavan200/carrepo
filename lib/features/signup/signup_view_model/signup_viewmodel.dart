import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_model/signup_res_model.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_repo/repository.dart';

class SignUpViewModel extends ChangeNotifier {
  Repository repository;
  SignUpViewModel({required this.repository});

  Future<SignupResModel> signUpTheUser(SignupResModel model) async {
    try {
      final response = await repository.signup(model.toJson());
      SignupResModel signUpResponseModel =
          SignupResModel.fromJson(response.data);
      return signUpResponseModel;
    } catch (e) {
      return SignupResModel(error: true,message: "Something went Wrong");
    }
  }
}