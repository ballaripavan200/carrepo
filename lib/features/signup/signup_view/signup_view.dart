import 'package:flutter/material.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_model/signup_req_model.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_model/signup_res_model.dart';
import 'package:pavan_car_rental_1062/features/signup/signup_view_model/signup_viewmodel.dart';
import 'package:pavan_car_rental_1062/services/navigation_services.dart';
import 'package:pavan_car_rental_1062/utils/loader_utils.dart';
import 'package:pavan_car_rental_1062/widget/button_widget.dart';
import 'package:pavan_car_rental_1062/widget/logo_widget.dart';
import 'package:pavan_car_rental_1062/widget/text_button_widget.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({ super.key });

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const LogoWidget(
                  height: 250,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Welcome Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Sign up to your account using email, name, and password",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _nameTextController,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonWidget(
                      buttonTitle: "Sign Up",
                      onPressed: () {
                        signUpAction();
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButtonWidget(
                        buttonTitle: "Login",
                        onPressed: () {
                          NavigationServices().goBack();
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpAction() async {
    SignupReqModel requestModel = SignupReqModel(
        name: _nameTextController.text,
        email: _emailTextController.text,
        password: _passwordTextController.text);
    final signUpvm = Provider.of<SignUpViewModel>(context, listen: false); // Correct provider usage
    LoaderWidget.showLoader(message: "Sign up processing");
    final response = await signUpvm.signUpTheUser(requestModel as SignupResModel);
    LoaderWidget.hideLoader();
    showAlertMessage(message: response.message ?? "");
  }

  void showAlertMessage({String message = ""}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  NavigationServices().goBack();
                },
                child: const Text("Ok"))
          ],
        );
      },
    );
  }
}