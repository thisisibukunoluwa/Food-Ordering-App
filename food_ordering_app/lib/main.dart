import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering_app/features/startup/startup_view.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:food_ordering_app/services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesUtils.init();
  runApp(const FoodrApp());
}

class FoodrApp extends StatelessWidget {
  const FoodrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodr',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const StartupView(),
        navigatorKey: navigationService.navigatorKey,
      ),
    );
  }
}
