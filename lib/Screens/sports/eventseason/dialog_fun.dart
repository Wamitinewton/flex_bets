import 'package:betting_app/Models/event_season.dart';
import 'package:betting_app/Screens/sports/eventseason/baseball_details.dart';
import 'package:flutter/material.dart';

Future<void> showSlideUpDialog(BuildContext context, Event event) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(anim1),
        child: child,
      );
    },
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: EventDetailDialog(event: event),
        ),
      );
    },
  );
}
