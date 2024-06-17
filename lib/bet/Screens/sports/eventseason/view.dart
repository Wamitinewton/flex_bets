import 'package:betting_app/bet/Models/event_season.dart';
import 'package:betting_app/bet/Screens/sports/eventseason/controller.dart';
import 'package:betting_app/bet/Screens/sports/eventseason/dialog_fun.dart';

import 'package:betting_app/bet/common/utils/styles.dart';
import 'package:betting_app/bet/entity/app_user.dart';
import 'package:betting_app/bet/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, required this.user, required this.userProvider});
  final AppUser? user;
  final UserProvider? userProvider;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final EventController _eventController = Get.put(EventController());
   

  Future<void> _refreshContents() async {
    await _eventController.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event Sports'),
        ),
        backgroundColor: kRaisinBlack,
        body: LiquidPullToRefresh(
          key: const Key('Refresh contents'),
          animSpeedFactor: 2.0,
          onRefresh: _refreshContents,
          color: kDefaultIconDarkColor,
          springAnimationDurationInMilliseconds: 1000,
          showChildOpacityTransition: true,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _eventController.events.length,
                    itemBuilder: (context, index) {
                      Event event = _eventController.events[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(event.strAwayTeamBadge!))),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: Obx(() {
                  if (_eventController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (_eventController.events.isEmpty) {
                    return const Center(child: Text('No events found'));
                  } else {
                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[400],
                        height: 0.5,
                      ),
                      itemCount: _eventController.events.length,
                      itemBuilder: (context, index) {
                        Event event = _eventController.events[index];
                        return GestureDetector(
                          onTap: () {
                            showSlideUpDialog(context, event);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 180,
                            decoration: const BoxDecoration(
                              color: kOffBlack,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: Image(
                                          image: NetworkImage(
                                            event.strAwayTeamBadge!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        event.strAwayTeam!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        event.strLeague!,
                                        style: const TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                      Text(
                                        '${event.intAwayScore}-${event.intHomeScore}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                        ),
                                      ),
                                      Text(
                                        event.strSport!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: Image(
                                          image: NetworkImage(
                                            event.strHomeTeamBadge!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        event.strHomeTeam!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ));
  }
}
