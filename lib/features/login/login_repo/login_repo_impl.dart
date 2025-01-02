import 'package:pavan_car_rental_1062/features/login/login_repo/login_repo.dart';
import 'package:pavan_car_rental_1062/services/network_services.dart';
import 'package:pavan_car_rental_1062/services/server_const.dart';

class LoginRepoImpl extends LoginRepo{
  final _apiServices = ApiServices();
   @override
  Future<dynamic> login(payload) {
    return _apiServices.postCall(ServerConstants.signup, payload);
  }
}