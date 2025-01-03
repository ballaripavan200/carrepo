import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/login/login_model/login_req_model.dart';
import 'package:pavan_car_rental_1062/features/login/login_model/login_res_model.dart';
import 'package:pavan_car_rental_1062/features/login/login_view_model/login_view_model.dart';
import 'package:pavan_car_rental_1062/routers/routes_const.dart';
import 'package:pavan_car_rental_1062/services/navigation_services.dart';
import 'package:pavan_car_rental_1062/utils/loader_utils.dart';
import 'package:pavan_car_rental_1062/widget/button_widget.dart';
import 'package:pavan_car_rental_1062/widget/input_text_field_widget.dart';
import 'package:pavan_car_rental_1062/widget/logo_widget.dart';
import 'package:pavan_car_rental_1062/widget/text_button_widget.dart';
import 'package:pavan_car_rental_1062/widget/title_and_sub_heading_widget.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const LogoWidget(height: 250),
                const TitleAndSubHeadingWidget(
                  title: "Welcome Back",
                  subHeading: "Log in to your account using email",
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 5),
                      InputTextFieldWidget(
                        hintText: "Enter your email",
                        textEditingController: _emailTextController,
                        focusNode: _emailFocusNode,
                        prefixIcon: const Icon(Icons.email),
                        borderColor: _emailFocusNode.hasFocus
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Password", style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 5),
                      InputTextFieldWidget(
                        hintText: "Enter your password",
                        textEditingController: _passwordTextController,
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        borderColor: _passwordFocusNode.hasFocus
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButtonWidget(
                      buttonTitle: "Forgot Password?",
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonWidget(
                    buttonTitle: "Login",
                    onPressed: () {
                      loginAction();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ButtonWidget(
                    buttonTitle: "Don't have an account? Sign Up",
                    onPressed: () {
                      NavigationServices().navigateTo(RoutesConst.SignupView);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginAction() async {
    LoginReqModel requestModel = LoginReqModel(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );

    LoginViewModel viewModel =
        Provider.of<LoginViewModel>(context, listen: false);
    LoaderWidget.showLoader();
    final LoginResModel response = await viewModel.loginApi(requestModel);
    LoaderWidget.hideLoader();
    if (response.error == false) {
      NavigationServices().replaceAll(RoutesConst.homeScreen);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text("Invalid user name and password")),
        );
    }
  }
}