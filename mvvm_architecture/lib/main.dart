import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_architecture/Utills/Rouute/route_name.dart';
import 'package:mvvm_architecture/Utills/Rouute/routes.dart';
import 'package:mvvm_architecture/View_Model/auth_view_model.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            //1,2,...... provider reference
            ChangeNotifierProvider(create: (_) => auth_provider()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),

          ],

          child: Builder(
            builder: (BuildContext context) {
          
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'MVVM Architecture',
                theme: ThemeData(
                   brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.blue),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),

                
                // home:HomeScreen(),
                initialRoute:RouteName.login,
                onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
