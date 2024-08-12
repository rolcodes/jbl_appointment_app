import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class NoUpcomingAppointment extends StatelessWidget {
  const NoUpcomingAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
      EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.amber,
              Colors.amber,
              TColors.primary,
              TColors.primary,
            ],
            stops: [
              0,
              0.2,
              0.8,
              1
            ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Appointment',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(color: Colors.white, shadows: [
              Shadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 1),
                  blurRadius: 10)
            ]),
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Text(
                    'No upcoming appointment yet',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(
                        color: Colors.white,
                        fontWeightDelta: 2),
                  ),
                  Text(
                    'All approved appointments will be displayed here',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(
                        color: Colors.white,
                        fontWeightDelta: -1),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
