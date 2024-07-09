import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        backgroundColor: TColors.secondary,
        title: Text('Notifications',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: TColors.accent)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('New',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),

              /// -- Popup Menu Button
              PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    _selection = value;
                  });
                },
                color: Colors.white,
                child: ListTile(
                  leading: ClipOval(
                      child: Image.asset(
                    'assets/images/jbl_images/jbl-favicon-squarebg.png',
                    fit: BoxFit.cover,
                  )),
                  title: Text(
                    "Get the best deals this Payday Sale! Mag-book na with 10% discount!",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle:
                      Text('1 h', style: Theme.of(context).textTheme.bodySmall),
                  trailing: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline_rounded),
                        SizedBox(width: 10),
                        Text('Remove Notification'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    child: Row(
                      children: [
                        Icon(Icons.report_gmailerrorred_rounded),
                        SizedBox(width: 10),
                        Text('Report issue to notification team'),
                      ],
                    ),
                  ),
                ],
              ),

              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                    style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('1 h', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('2 h', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('4 h', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),

              /// Heading
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Earlier',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('18 h', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('1 d', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('1 d', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('2 d', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('2 d', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('2 d', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  'assets/images/jbl_images/jbl-favicon-squarebg.png',
                  fit: BoxFit.cover,
                )),
                title: Text(
                  "Reminder! You have an upcoming reservation for June 18.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                subtitle:
                    Text('2 d', style: Theme.of(context).textTheme.bodySmall),
                selected: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
