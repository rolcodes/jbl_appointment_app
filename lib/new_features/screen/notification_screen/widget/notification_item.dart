import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final void Function() onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TColors.primary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: TColors.primary.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [TColors.primary, Colors.amber.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: TColors.primary,
                    fontSizeDelta: 10,
                    shadows: [
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(1, 3),
                        blurRadius: 4,
                        spreadRadius: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
