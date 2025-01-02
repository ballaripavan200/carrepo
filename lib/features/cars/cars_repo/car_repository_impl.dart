import 'package:pavan_car_rental_1062/features/cars/cars_repo/car_repository.dart';
import 'package:pavan_car_rental_1062/services/network_services.dart';
import 'package:pavan_car_rental_1062/services/server_const.dart';

class CarRepositoryImpl extends CarRepository {
  final ApiServices _apiServices = ApiServices();
  @override
  Future<dynamic> getCarsList() {
    return _apiServices.getCall(ServerConstants.getAllCars);
  }
  
  @override
  Future addCar(data) {
    // TODO: implement addCar
    throw UnimplementedError();
  }
}