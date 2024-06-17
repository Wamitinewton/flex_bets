// ignore_for_file: avoid_print

import 'package:betting_app/bet/Models/user_registration.dart';
import 'package:betting_app/bet/Screens/AuthScreens/add_photo_screen.dart';
import 'package:betting_app/bet/common/widgets/custom_button.dart';
import 'package:betting_app/bet/helpers/constant.dart';
import 'package:betting_app/bet/helpers/screen_navigation.dart';
import 'package:betting_app/bet/helpers/utils.dart';
import 'package:betting_app/bet/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignpScreen extends StatefulWidget {
  const SignpScreen({Key? key}) : super(key: key);
  static String id = 'signup';

  @override
  State<SignpScreen> createState() => _SignpScreenState();
}

class _SignpScreenState extends State<SignpScreen> {
  bool isChecked = false;
  final countryController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  UserRegistration userRegistration = UserRegistration();
  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();

    super.dispose();
  }

  bool check(bool b) {
    setState(() {
      isChecked == true ? isChecked = false : true;
    });
    return isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      color: yellow, borderRadius: BorderRadius.circular(15)),
                  child: const Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign up!',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: userNameController,
                  icon: Icons.abc_rounded,
                  hint: 'upto 50 Characters',
                  label: 'Username',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: countryController,
                  icon: Icons.location_city,
                  hint: 'your country',
                  label: 'Country',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: emailController,
                  icon: Icons.person,
                  hint: 'someone@mail.com',
                  label: 'Email',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.lock,
                  hint: 'Password',
                  label: 'Password',
                  suffixIcon: Icons.remove_red_eye_outlined,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: confirmPassController,
                  icon: Icons.lock,
                  hint: 'Confirm Password',
                  label: 'Confirm Password',
                  suffixIcon: Icons.remove_red_eye_outlined,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonName: 'Continue',
                  width: 300,
                  height: 50,
                  function: () {
                    userRegistration.username = userNameController.text.trim();
                    userRegistration.email = emailController.text.trim();
                    userRegistration.country = countryController.text.trim();
                    userRegistration.password = passwordController.text.trim();
                    userRegistration.username.isEmpty ||
                            userRegistration.country.isEmpty ||
                            userRegistration.email.isEmpty ||
                            userRegistration.password.isEmpty
                        ? showSnackBar('Fill all the fields', context)
                        : userRegistration.username.characters.length <= 50
                            ? changeScreen(
                                context,
                                AddPhotoScreen(
                                    userRegistration: userRegistration))
                            : showSnackBar(
                                'UserName can have max 50 characters', context);
                  },
                ),
                const SizedBox(height: 15),
                const Text('OR',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                const SizedBox(height: 5),
                const Text('Continue with',
                    style: TextStyle(color: Colors.grey, fontSize: 17)),
                const SizedBox(height: 15),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: []),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, LoginScreen.id)},
                  child: Text.rich(TextSpan(
                      text: 'Have an account?  ',
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: yellow),
                        )
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
