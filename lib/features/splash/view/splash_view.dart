import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/splash/view_model/splash_viewmodel.dart';
import 'package:pavan_car_rental_1062/routers/routes_const.dart';
import 'package:pavan_car_rental_1062/services/navigation_services.dart';
import 'package:pavan_car_rental_1062/widget/logo_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({ super.key });

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoWidget(width: 250,height: 250,),
      ),
    );
  }

  @override
  void initState() {
    checkUserSession();
    super.initState();
  }
  checkUserSession()async{
  await Future.delayed(const Duration(seconds:splashDuration ));
  NavigationServices().navigateTo(RoutesConst.loginScreen);
  }
}