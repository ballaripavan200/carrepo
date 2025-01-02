import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_view/cars_list_screen.dart';
import 'package:pavan_car_rental_1062/features/profile/profile_screen.dart';
import 'package:pavan_car_rental_1062/utils/colours_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> screens = const [
    CarsListScreen(),
    ProfileScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColoursConst.pc,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (value) => onTapAction(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: "Fav Cars"),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  onTapAction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}