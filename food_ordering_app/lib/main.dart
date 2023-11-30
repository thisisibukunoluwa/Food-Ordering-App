import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/core/routes.dart';
import 'package:food_ordering_app/features/splash/splash_view.dart';
import 'package:food_ordering_app/services/navigation_service.dart';

void main() {
  runApp(FoodrApp());
}

class FoodrApp extends StatelessWidget {
  const FoodrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 852),
        child:  MaterialApp(
        title: ,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashView(),
        navigatorKey:navigationService.navigatorKey,
      ),
    );
  }
}



