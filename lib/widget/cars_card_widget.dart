import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_model/cars_model.dart';
import 'package:pavan_car_rental_1062/widget/button_widget.dart';
import 'package:pavan_car_rental_1062/widget/cache_network_image_widget.dart';

class CarsCardWidget extends StatelessWidget {
  const CarsCardWidget(
      {super.key, required this.carData, required this.bookingAction});
  final Cars carData;
  final Function() bookingAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CacheNetworkImageWidget(imageUrl: carData.image ?? ""),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carData.name ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      carData.transmission ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      carData.fuelType ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ${carData.pricePerDay} / day",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
              width: 150,
              child: ButtonWidget(
                  buttonTitle: "Book Now",
                  onPressed: () {
                    bookingAction();
                  }))
        ],
      ),
    );
  }
}
