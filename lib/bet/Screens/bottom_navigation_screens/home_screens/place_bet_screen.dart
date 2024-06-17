// ignore_for_file: avoid_print

import 'package:betting_app/bet/Screens/bottom_navigation_screens/bottom_navigation_screen.dart';
import 'package:betting_app/bet/Screens/bottom_navigation_screens/search_screens/search_screen.dart';
import 'package:betting_app/bet/common/widgets/custom_round_button.dart';
import 'package:betting_app/bet/common/widgets/custom_text.dart';
import 'package:betting_app/bet/entity/app_user.dart';
import 'package:betting_app/bet/helpers/constant.dart';
import 'package:betting_app/bet/helpers/screen_navigation.dart';
import 'package:betting_app/bet/helpers/utils.dart';
import 'package:betting_app/bet/common/widgets/custom_modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../report_screens/report_screen.dart';

class PLaceBetScreen extends StatefulWidget {
  const PLaceBetScreen(
      {super.key,
      required this.data,
      required this.selected,
      required this.name,
      required this.user});
  static String id = 'home';
  final String selected;
  final String name;
  final QueryDocumentSnapshot data;
  final AppUser user;

  @override
  State<PLaceBetScreen> createState() => _PLaceBetScreenState();
}

class _PLaceBetScreenState extends State<PLaceBetScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  bool _isLoading = false;
  int _currentValue = 0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Image(
            image: AssetImage('assets/pbets.jpg'),
            height: 25,
          )),
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(
                Icons.search,
                color: yellow,
                size: 25,
              ),
              onPressed: () => changeScreen(
                  context,
                  SearchScreen(
                    user: widget.user,
                  ))),
          actions: [
            Row(
              children: [
                Text(
                  widget.user.wallet.toString(),
                  style: TextStyle(
                      color: white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image(
                      image: const AssetImage(
                        'assets/black-coin.png',
                      ),
                      color: yellow,
                      height: 20,
                      width: 20,
                    ))
              ],
            )
          ],
        ),
        backgroundColor: black,
        body: card(context, widget.data, widget.selected));
  }

  Padding card(
      BuildContext context, QueryDocumentSnapshot data, String selected) {
    DateTime dateTime = DateTime.parse(data['dateTime'].toDate().toString());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height * 0.30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 35),
                          child: CustomText(
                            text: data['def'],
                            size: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: () => changeScreen(
                                context,
                                ReportScreen(
                                  data: data,
                                  name: widget.name,
                                )),
                            icon: CircleAvatar(
                                radius: 20,
                                backgroundColor: white,
                                child: Center(
                                    child: Icon(
                                  Icons.warning_rounded,
                                  color: black,
                                ))))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CRoundButton(
                            function: () {},
                            text: data[selected],
                            active: true),
                        CustomText(
                          text: "X ${data['multiplier']}",
                          size: 20,
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: const BoxDecoration(
                        color: Color(0xFFE1E4E8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: ((value) {
                          setState(() {
                            _currentValue =
                                value.isNotEmpty ? int.parse(value) : 0;
                          });
                        }),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Amount to bet',
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.4))),
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: white),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: NumberPicker(
                  //     selectedTextStyle: TextStyle(color: yellow, fontSize: 20),
                  //     textStyle: TextStyle(color: white),
                  //     value: _currentValue,
                  //     minValue: 0,
                  //     maxValue: 100,
                  //     onChanged: (value) => setState(() => _currentValue = value),
                  //   ),
                  // ),
                  Column(
                    children: [
                      const CustomText(
                        text: "Result",
                      ),
                      CustomText(
                        text:
                            '${_currentValue * double.parse(data['multiplier'].toString())}',
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: 'Ends',
                            weight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              text:
                                  "${dateTime.day}/${dateTime.month}/${dateTime.year}",
                            ),
                            CustomText(
                              text: '${dateTime.hour}:${dateTime.minute}',
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: blue,
                                child: Icon(
                                  Icons.person,
                                  color: white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CRoundButton(
                                function: () {},
                                text: data['name'],
                                active: true,
                                fontSize: 12,
                                height: 40,
                                width: 90,
                              )
                            ],
                          ),
                        ),
                        CRoundButton(
                          function: () {
                            result = _currentValue *
                                double.parse(data['multiplier'].toString());
                            widget.user.wallet >= _currentValue && result != 0.0
                                ? placeBet(
                                    widget.data.id,
                                    widget.selected,
                                    widget.data[widget.selected],
                                    widget.user.wallet - _currentValue)
                                : showSnackBar(
                                    'You do not have enough coins to bet',
                                    context);
                          },
                          text: 'Place Bet',
                          textColor: black,
                          color: yellow,
                          fontSize: 17,
                          width: 120,
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  placeBet(id, option, correct, updatedWallet) {
    setState(() {
      _isLoading = true;
    });
    try {
      instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update({'wallet': updatedWallet}).then((value) {
        instance
            .collection('publish')
            .doc(id)
            .collection('placeBet')
            .doc(auth.currentUser!.uid)
            .set({
          'option': '$option',
          'answer': '$correct',
          'bet': '$_currentValue',
          'result': result
        }).then((value) {
          print('Bet has been placed');
          String totalBet = (int.parse(widget.data['totalBet'] == ''
                      ? 0.toString()
                      : widget.data['totalBet']) +
                  _currentValue)
              .toString();
          instance
              .collection('publish')
              .doc(id)
              .update({'totalBet': totalBet}).then((value) {
            addBetInUser(id);
          });
        });
      });
    } catch (e) {
      showSnackBar(e.toString(), context);
      print(e.toString());
    }
  }

  addBetInUser(id) {
    try {
      instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('betPlaced')
          .doc(id)
          .set({}).then((value) {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.green,
              contentPadding: const EdgeInsets.all(16.0),
              content: const Text(
                'The bet has been Placed',
                style: TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    changeScreen(context, const BottomNavigationScreen());
                  },
                ),
              ],
            );
          },
          context: context,
        );
        setState(() {});
      });
    } catch (e) {
      showSnackBar(e.toString(), context);
      print(e.toString());
    }
  }
}
