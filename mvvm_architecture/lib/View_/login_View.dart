import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_architecture/Resources/Compponent/round_buttons.dart';
import 'package:mvvm_architecture/Utills/Rouute/route_name.dart';
import 'package:mvvm_architecture/Utills/utills.dart';
import 'package:mvvm_architecture/View_Model/auth_view_model.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_dev/State_Management/Utills/Rouute/route_name.dart';
// import 'package:flutter_dev/State_Management/Utills/utills.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();

  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();

  ValueNotifier<bool> obsecured = ValueNotifier<bool>(false);
  @override
  void dispose() {
    _email_controller.dispose();
    _password_controller.dispose();

    emailfocusnode.dispose();
    passwordfocusnode.dispose();

    obsecured.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('login Screen View', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body:
      //this is for utils for text
      // InkWell(
      //   onTap: () {
      //     Utills.toastMessage('You tapped me');
      //     Utills.flushBarErrorMessages('Hello', context);
      //     Utills.snakbar('Hello World', context);
      //   },
      //   child: Center(
      //     child: Text(
      //       'CLick',
      //       style: TextStyle(color: Colors.black, fontSize: 50.sp),
      //     ),
      //   ),
      // ),
      // This is for login screen
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              //1st Textfield for email
              TextFormField(
                onFieldSubmitted: (value) {
                  Utills.fieldfocusNode(
                    context,
                    emailfocusnode,
                    passwordfocusnode,
                  );
                },
                canRequestFocus: true,
                focusNode: emailfocusnode,
                style: TextStyle(color: Colors.black),
                controller: _email_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  // labelStyle: TextStyle(color: Colors.teal),
                  prefixIcon: Icon(Icons.alternate_email, color: Colors.blue),
                  hintStyle: TextStyle(color: Colors.indigo),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              ValueListenableBuilder(
                valueListenable: obsecured,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordfocusnode,
                    style: TextStyle(color: Colors.black),
                    obscureText: obsecured.value,
                    obscuringCharacter: '*',
                    controller: _password_controller,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      labelText: 'Password',
                      // labelStyle: TextStyle(color: const Color.fromARGB(255, 11, 185, 168)),
                      suffixIcon: InkWell(
                        onTap: () {
                          obsecured.value = !obsecured.value;
                        },
                        child: Icon(
                          obsecured.value
                              ? Icons.visibility_off
                              : Icons.visibility_sharp,
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock_open, color: Colors.blue),
                      hintStyle: TextStyle(color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 50.h),
              RoundButton(
                title: 'login',
                loading: authviewModel.loading,
                onpressed: () {
                  if (_email_controller.text.isEmpty) {
                    Utills.flushBarErrorMessages(
                      'Please! Enter in Email',
                      context,
                    );
                  } else if (_email_controller.text.isEmpty) {
                    Utills.flushBarErrorMessages(
                      'Please! Enter in Password',
                      context,
                    );
                  } else if (_password_controller.text.length < 6) {
                    Utills.flushBarErrorMessages(
                      'Please! Enter 6 digit Password',
                      context,
                    );
                  } else {
                    Map data = {
                      "email": _email_controller.text.toString(),
                      "password": _password_controller.text.toString(),
                    };
                    authviewModel.login_api(data, context);
                    'api hit';
                  }
                },
              ),
              SizedBox(height: 20.sp),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.Sign_up);
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.blue, fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
