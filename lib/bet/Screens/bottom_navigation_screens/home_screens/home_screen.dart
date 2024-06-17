// ignore_for_file: avoid_print

import 'package:betting_app/bet/Screens/bottom_navigation_screens/home_screens/bet_home_card.dart';
import 'package:betting_app/bet/entity/app_user.dart';
import 'package:betting_app/bet/helpers/constant.dart';
import 'package:betting_app/bet/helpers/screen_navigation.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../provider/user_provider.dart';
import '../search_screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user, required this.userProvider});
  static String id = 'home';
  final AppUser? user;
  final UserProvider? userProvider;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                widget.user!.wallet.toString(),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('publish')
            .orderBy('publishTime', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var items = snapshot.data!.docs;
          print("Total items: ${items.length}"); // Debugging log

          if (items.isEmpty) {
            return const Center(child: Text('No active bets found.'));
          }

          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              var data = items[index];
              DateTime dateTime =
                  DateTime.parse(data['dateTime'].toDate().toString());
              return BetHomeCard(
                data: data,
                user: widget.user,
                dateTime: dateTime,
              );
            },
            itemCount: items.length,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }
}
