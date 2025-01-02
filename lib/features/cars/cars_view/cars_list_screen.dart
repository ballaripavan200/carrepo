import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_model/cars_model.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_view_model/cars_view_model.dart';
import 'package:pavan_car_rental_1062/widget/cars_card_widget.dart';
import 'package:provider/provider.dart';

class CarsListScreen extends StatefulWidget {
  const CarsListScreen({super.key});

  @override
  _CarsListScreenState createState() => _CarsListScreenState();
}

class _CarsListScreenState extends State<CarsListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch cars when the widget is first created
    Future.delayed(Duration.zero, () => fetchCars());
  }

  // Fetching cars from the view model
  fetchCars() async {
    final carsViewModel = Provider.of<CarsViewModel>(context, listen: false);
    await carsViewModel.getCars();
  }

  @override
  Widget build(BuildContext context) {
    // Use Consumer for listening to changes in CarsViewModel
    return Consumer<CarsViewModel>(
      builder: (context, carsViewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Cars List"),
            backgroundColor: Colors.white,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(Icons.add),
            onPressed: () {
              // Add your onPressed functionality here
            },
          ),
          body: carsViewModel.cars.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: carsViewModel.cars.length,
                  itemBuilder: (context, index) {
                    final carData = carsViewModel.cars[index];
                    return CarsCardWidget(carData: Cars(), bookingAction: () {},); // This will work now
                  },
                ),
        );
      },
    );
  }
}
