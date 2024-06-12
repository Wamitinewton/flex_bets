import 'package:betting_app/Models/event_season.dart';
import 'package:betting_app/common/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventDetailDialog extends StatelessWidget {
  final Event event;

  const EventDetailDialog({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: 600,
        decoration: const BoxDecoration(
          color: kOffBlack,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(event.strThumb!)),
            Text(
              '${event.strAwayTeam} vs ${event.strHomeTeam}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'League: ${event.strLeague}',
              style: const TextStyle(
                fontSize: 18,
                color: kLynxWhite,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Score: ${event.intAwayScore} - ${event.intHomeScore}',
              style: const TextStyle(
                fontSize: 18,
                color: kLynxWhite,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Sport: ${event.strSport}',
              style: const TextStyle(
                fontSize: 18,
                color: kLynxWhite,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Event Date: ${event.dateEvent}',
              style: const TextStyle(
                fontSize: 18,
                color: kLynxWhite,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Country: ${event.strCountry}',
              style: const TextStyle(
                fontSize: 18,
                color: kLynxWhite,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(event.strAwayTeamBadge!))),
                ),
                Column(
                  children: [
                    Text(
                      '${event.strAwayTeam}',
                      style: kNunitoSansBold18.copyWith(color: kLynxWhite),
                    ),
                    Text('vs', style: kNunitoSansBold16.copyWith(color: Colors.greenAccent),),
                    Text(
                      '${event.strHomeTeam}',
                      style: kNunitoSansBold18.copyWith(color: kLynxWhite),
                    )
                  ],
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(event.strHomeTeamBadge!))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
