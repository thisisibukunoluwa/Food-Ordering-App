import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/routes.dart';
import 'package:food_ordering_app/features/home/home_view.dart';
import 'package:food_ordering_app/features/splash/splash_view.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
import 'package:food_ordering_app/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? isFirstLaunch = PreferencesUtils.getBool('firstlaunch');
    // PreferencesUtils.clear();
    // print(isFirstLaunch!);
    if (isFirstLaunch!) {
      // PreferencesUtils.setBool('firstlaunch', false);
      return SplashView();
    } else {
      return HomeView();
    }
  }
}

