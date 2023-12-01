import 'package:flutter/material.dart';
import 'package:food_ordering_app/core/routes.dart';
import 'package:food_ordering_app/services/navigation_service.dart';
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
    _checkFirstLaunch();
  }

  Future<bool> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('firstlaunch') ?? true;
    if (isFirstLaunch) {
      await prefs.setBool('firstLaunch', false);
      navigationService.navigateToNamed(Routes.splash);
      return true;
    } else {
      navigationService.navigateOffNamed(Routes.home);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {}
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
