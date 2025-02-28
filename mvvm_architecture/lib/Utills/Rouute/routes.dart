import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/Utills/Rouute/route_name.dart';
import 'package:mvvm_architecture/View_/Sign_up_view.dart';
import 'package:mvvm_architecture/View_/home_View.dart';
import 'package:mvvm_architecture/View_/login_View.dart';


class Routes {
  static Route<dynamic>  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          );
        }

      case RouteName.login:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => Login_Screen(),
          );
        }
        
        case RouteName.Sign_up:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => Sign_up(),
          );
        }
        

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Column(children: [
              Center(child: Text('No Route  Defined'))

            ],
          ));
          },
        );
    }
  }
}
