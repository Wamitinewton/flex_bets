import 'dart:async';


import 'package:betting_app/bet/Screens/AuthScreens/success_screen.dart';
import 'package:betting_app/bet/common/widgets/custom_button.dart';
import 'package:betting_app/bet/helpers/constant.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  static String id = 'emailVerification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Timer? timer;
  bool isEmailVerified = false;
  bool canResendEmail = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            
              const SizedBox(height: 20),
              Text(
                'The verification link has been sent to your email!',
                style: TextStyle(color: yellow, fontSize: 17),
              ),
              const SizedBox(height: 80),
              const SizedBox(height: 100),
              CustomButton(
                buttonName: 'Resend Email',
                width: 300,
                height: 50,
                color: yellow,
                // canResendEmail ? yellow : kPrimaryDark,
                function: () {
                  // canResendEmail ? verifyEmail() : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonName: 'Verification Done',
                width: 300,
                height: 50,
                color: yellow,
                function: () {
                  // checkEmailVerified();
                  Navigator.pushNamed(context, SuccessScreen.id);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonName: 'Cancel',
                width: 300,
                height: 50,
                color: yellow,
                function: () {
                  // FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
