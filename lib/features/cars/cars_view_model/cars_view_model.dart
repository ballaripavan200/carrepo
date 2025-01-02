import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_model/cars_model.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_repo/car_repository.dart';
import 'package:pavan_car_rental_1062/utils/loader_utils.dart';

class CarsViewModel extends ChangeNotifier {
  List<Cars> cars = [];
  CarRepository repository;

  CarsViewModel({required this.repository});

  // Api Service
  // Repos -> abstract -> imple

  Future<void> getCars() async {
    try {
      LoaderWidget.showLoader(); // Show loader
      final response = await repository.getCarsList(); // Fetch data from repository
      LoaderWidget.hideLoader(); // Hide loader
      if (response.statusCode == 200) {
        final carsModel = CarsModelData.fromJson(response.data); // Parse response
        cars = carsModel.cars ?? []; // Assign data to cars
      } else {
        cars = []; // In case of non-200 response, reset cars list
      }
    } catch (e) {
      LoaderWidget.hideLoader(); // Hide loader in case of error
      cars = []; // Reset cars list in case of an error
    } finally {
      notifyListeners(); // Notify listeners to update the UI
    }
  }
}

// The view will call ViewModel -> ViewModel calls repository -> API service
