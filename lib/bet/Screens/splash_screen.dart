import 'package:betting_app/bet/Screens/AuthScreens/login_screen.dart';
import 'package:betting_app/bet/helpers/constant.dart';
import 'package:betting_app/bet/helpers/screen_navigation.dart';
import 'package:betting_app/bet/helpers/shared_preferences_utils.dart';
import 'package:betting_app/bet/provider/user_provider.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_screens/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserProvider userProvider = UserProvider();
  @override
  void initState() {
    super.initState();
    checkIfUserExists();
  }

  Future<void> checkIfUserExists() async {
    String? userId = await SharedPreferencesUtil.getUserId();
    Navigator.pop(context);
    if (userId != null) {
      changeScreen(context, const BottomNavigationScreen());
    } else {
      changeScreen(context, const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(),
        ),
      ),
    );
  }
}
