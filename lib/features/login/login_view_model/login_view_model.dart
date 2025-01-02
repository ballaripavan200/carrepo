import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/login/login_model/login_req_model.dart';
import 'package:pavan_car_rental_1062/features/login/login_model/login_res_model.dart';
import 'package:pavan_car_rental_1062/features/login/login_repo/login_repo.dart';
import 'package:pavan_car_rental_1062/utils/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginViewModel extends ChangeNotifier {
  LoginRepo repository;
  LoginViewModel({required this.repository});

  Future<LoginResModel> loginApi(LoginReqModel model) async {
    try {
      final response = await repository.login(model.toJson());
      LoginResModel modelData =
          LoginResModel.fromJson(response.data ??{});
      await saveTheUserData(modelData);
      return modelData;
    } catch (e) {
      return LoginResModel(error: true);
    }
  }
  saveTheUserData(LoginResModel responseModel) async {
    if (responseModel.error == false) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          LocalStorageConstants.userId, responseModel.student?.id ?? "");
      await prefs.setString(
          LocalStorageConstants.name, responseModel.student?.name ?? "");
      await prefs.setString(
          LocalStorageConstants.email, responseModel.student?.email ?? "");
    }
  }
}