import 'package:pavan_car_rental_1062/features/signup/signup_repo/repository.dart';
import 'package:pavan_car_rental_1062/services/network_services.dart';
import 'package:pavan_car_rental_1062/services/server_const.dart';

class RepositoryImpl extends Repository{
  final ApiServices _apiServices = ApiServices();
  @override
  Future<dynamic> signup(payload) {
    throw _apiServices.postCall(ServerConstants.signup, payload);
  }
}