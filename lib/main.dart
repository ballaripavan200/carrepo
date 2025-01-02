import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/login/login_repo/login_repo_impl.dart';
import 'package:pavan_car_rental_1062/features/login/login_view_model/login_view_model.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_repo/repository_impl.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_view_model/signup_viewmodel.dart';
import 'package:pavan_car_rental_1062/features/cars/cars_repo/car_repository_impl.dart'; 
import 'package:pavan_car_rental_1062/features/cars/cars_view_model/cars_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pavan_car_rental_1062/routers/routes.dart';

void main() {
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SignUpViewModel(repository: RepositoryImpl())),
        ChangeNotifierProvider(
            create: (_) => LoginViewModel(repository: LoginRepoImpl())),
        ChangeNotifierProvider(
            create: (_) =>
                CarsViewModel(repository: CarRepositoryImpl())), 
      ],
      child: MaterialApp.router(
        title: 'Pavan Car Rental',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
        builder: EasyLoading.init(),
      ),
    );
  }
}
