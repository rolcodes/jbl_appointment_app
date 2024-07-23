import 'package:appointment_app/admin/screens/Reservations/widget/admin_notifications.dart';
import 'package:appointment_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:badges/badges.dart' as badges;

import '../../../../services/shared_pref.dart';
import '../../../../utils/constants/colors.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  String? userAccbooking, id;

  /// Get name, email, image from local storage
  getDataFromSharedPref() async {
    userAccbooking = await SharedPreferenceHelper().getUserBookingId();
    id = await SharedPreferenceHelper().getUserID();
    setState(() {});
  }

  Stream? BookingStream;

  /// This function allows us to get booking details in firebase
  getOnTheLoad() async {
    // BookingStream =
    //     await DatabaseMethods().getUserAccBooking(id!, userAccbooking!);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  /// -- Widget for Upcoming Bookings Tab
  // Widget myBookings() {
  //   return StreamBuilder(
  //       stream: BookingStream,
  //       builder: (context, AsyncSnapshot snapshot) {
  //         /// if we have data, get all the docs
  //         return snapshot.hasData
  //             ? ListView.builder(
  //
  //           /// display as a list
  //             padding: EdgeInsets.zero,
  //             itemCount: snapshot.data.docs.length,
  //             scrollDirection: Axis.vertical,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index) {
  //               DocumentSnapshot ds = snapshot.data.docs[index];
  //               return
  //
  //                 /// Booking Items
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 22),
  //                   child: Material(
  //                     elevation: 2,
  //                     borderRadius: BorderRadius.circular(20),
  //                     child: Container(
  //                       height: 150,
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(20)),
  //                       child: Stack(
  //                         children: [
  //                           /// Image
  //                           Positioned(
  //                             top: 20,
  //                             left: 20,
  //                             child: ClipOval(
  //                                 child: Image.asset(
  //                                   ds["Image"],
  //                                   fit: BoxFit.cover,
  //                                   width: 60,
  //                                 )),
  //                           ),
  //
  //                           /// Product & Client
  //                           Positioned(
  //                             top: 26,
  //                             left: 96,
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 SizedBox(
  //                                   width: 240,
  //                                   child: Text(
  //                                     ds["Service"],
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .titleLarge!
  //                                         .apply(fontSizeDelta: 1),
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                   ),
  //                                 ),
  //                                 const SizedBox(height: 5),
  //                                 Row(
  //                                   children: [
  //                                     Row(
  //                                       children: [
  //                                         Text('Client: ',
  //                                             style: Theme.of(context)
  //                                                 .textTheme
  //                                                 .labelMedium!
  //                                                 .apply(fontSizeDelta: 2)),
  //                                         Text(ds["Username"],
  //                                             style: Theme.of(context)
  //                                                 .textTheme
  //                                                 .titleSmall!
  //                                                 .apply(fontSizeDelta: -2)),
  //                                       ],
  //                                     ),
  //                                     const SizedBox(width: 40),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //
  //                           /// Email
  //                           Positioned(
  //                             top: 95,
  //                             left: 30,
  //                             child: SizedBox(
  //                               width: 100,
  //                               child: Column(
  //                                 crossAxisAlignment:
  //                                 CrossAxisAlignment.center,
  //                                 children: [
  //                                   Text('Email',
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .labelMedium),
  //                                   Text(
  //                                     ds["Email"],
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelLarge!
  //                                         .apply(fontSizeDelta: -2),
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //
  //                           /// Telephone
  //                           Positioned(
  //                             top: 95,
  //                             left: 140,
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text('Telephone',
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelMedium),
  //                                 Text(ds["Telephone"],
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelLarge!
  //                                         .apply(fontSizeDelta: -2)),
  //                               ],
  //                             ),
  //                           ),
  //
  //                           /// Date
  //                           Positioned(
  //                             top: 95,
  //                             left: 230,
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text('Date',
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelMedium),
  //                                 Text(ds["Date"],
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelLarge!
  //                                         .apply(fontSizeDelta: -2)),
  //                               ],
  //                             ),
  //                           ),
  //
  //                           /// Time
  //                           Positioned(
  //                             top: 95,
  //                             left: 300,
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text('Time',
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelMedium),
  //                                 Text(ds["Time"],
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelLarge!
  //                                         .apply(fontSizeDelta: -2)),
  //                               ],
  //                             ),
  //                           ),
  //
  //                           /// Booking ID
  //                           Positioned(
  //                             top: 56,
  //                             left: 320,
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text(ds["Booking ID"],
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .bodySmall!
  //                                         .apply(
  //                                         fontSizeDelta: -2,
  //                                         color: TColors.primary)),
  //                                 Text('ID',
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .labelMedium),
  //                               ],
  //                             ),
  //                           ),
  //
  //                           /// Done button / Check Button
  //                           Positioned(
  //                             right: 5,
  //                             top: 5,
  //                             child: SizedBox(
  //                               width: 45,
  //                               height: 40,
  //                               child: IconButton(
  //                                 onPressed: () {
  //                                   /// AlertDialogBox from Cupertino Style
  //                                   showDialog(
  //                                       context: context,
  //                                       builder: (ctx) =>
  //                                           CupertinoAlertDialog(
  //                                             title:
  //                                             const Text("Update Status"),
  //                                             content: const Text(
  //                                                 "Confirm Booking Status below."),
  //                                             actions: [
  //                                               /// -- Completed Bookings
  //                                               TextButton(
  //                                                 child: const Text(
  //                                                     "Complete Booking",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                         Colors.green)),
  //                                                 onPressed: () async {
  //                                                   Map<String, dynamic>
  //                                                   userBookingCompleteMap =
  //                                                   {
  //                                                     "Service":
  //                                                     ds["Service"],
  //                                                     "Price": ds["Price"],
  //                                                     "Date": ds["Date"],
  //                                                     "Time": ds["Time"],
  //                                                     "Username":
  //                                                     ds["Username"],
  //                                                     "Telephone":
  //                                                     ds["Telephone"],
  //                                                     "Image": ds["Image"],
  //                                                     "Email": ds["Email"],
  //                                                     // "Reference": _currentDate.toString(), // Timestamp.now()
  //                                                     "Booking ID":
  //                                                     ds["Booking ID"],
  //                                                     // "Account ID": id,
  //                                                     "Timestamp":
  //                                                     Timestamp.now(),
  //                                                     // function for sorting
  //                                                   };
  //
  //                                                   await DatabaseMethods()
  //                                                       .addCompleteBookings(
  //                                                       userBookingCompleteMap,
  //                                                       ds["Booking ID"]);
  //
  //                                                   // Perform the delete action here
  //                                                   /// Delete Function from Firebase
  //                                                   await DatabaseMethods()
  //                                                       .DeleteBooking(ds.id);
  //
  //                                                   /// Snackbar
  //                                                   TLoaders.doneSnackBar(
  //                                                       title: 'Done',
  //                                                       message:
  //                                                       'Reservation was successful!');
  //
  //                                                   /// then pop
  //                                                   Navigator.of(context)
  //                                                       .pop();
  //                                                 },
  //                                               ),
  //
  //                                               /// -- Cancelled Bookings
  //                                               TextButton(
  //                                                 child: const Text(
  //                                                     "Cancel Booking",
  //                                                     style: TextStyle(
  //                                                         color: Colors.red)),
  //                                                 onPressed: () async {
  //                                                   Map<String, dynamic>
  //                                                   userCancelledBookingMap =
  //                                                   {
  //                                                     "Service":
  //                                                     ds["Service"],
  //                                                     "Price": ds["Price"],
  //                                                     "Date": ds["Date"],
  //                                                     "Time": ds["Time"],
  //                                                     "Username":
  //                                                     ds["Username"],
  //                                                     "Telephone":
  //                                                     ds["Telephone"],
  //                                                     "Image": ds["Image"],
  //                                                     "Email": ds["Email"],
  //                                                     // "Reference": _currentDate.toString(), // Timestamp.now()
  //                                                     "Booking ID":
  //                                                     ds["Booking ID"],
  //                                                     // "Account ID": id,
  //                                                     "Timestamp":
  //                                                     Timestamp.now(),
  //                                                     // function for sorting
  //                                                   };
  //
  //                                                   await DatabaseMethods()
  //                                                       .addCancelledBookings(
  //                                                       userCancelledBookingMap,
  //                                                       ds["Booking ID"]);
  //
  //                                                   // Perform the delete action here
  //                                                   /// Delete Function from Firebase
  //                                                   await DatabaseMethods()
  //                                                       .DeleteBooking(ds.id);
  //
  //                                                   /// Snackbar
  //                                                   TLoaders.doneSnackBar(
  //                                                       title: 'Cancelled',
  //                                                       message:
  //                                                       'Reservation was cancelled!');
  //
  //                                                   /// then pop
  //                                                   Navigator.of(context)
  //                                                       .pop();
  //                                                 },
  //                                               ),
  //                                               TextButton(
  //                                                 child: const Text("Back",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                         Colors.black)),
  //                                                 onPressed: () {
  //                                                   Navigator.of(context)
  //                                                       .pop();
  //                                                 },
  //                                               ),
  //                                             ],
  //                                           ));
  //                                 },
  //                                 icon: const Icon(Icons.more_horiz_rounded),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //             })
  //
  //         /// If no data show blank container
  //             : Container(
  //           // width: MediaQuery.of(context).size.width,
  //           // height: MediaQuery.of(context).size.height,
  //           // margin: const EdgeInsets.only(top: 120),
  //           // child: Center(
  //           //   child: Column(
  //           //     children: [
  //           //       Image.asset(
  //           //           'assets/images/animations/No data-amico.png',
  //           //           height: 220),
  //           //       Text('No Bookings Available',
  //           //           style:
  //           //               Theme.of(context).textTheme.headlineMedium),
  //           //       const SizedBox(height: 10),
  //           //       const Text(
  //           //           'Sorry no upcoming bookings as of the moment'),
  //           //     ],
  //           //   ),
  //           // ),
  //         );
  //       });
  // }

  /// -- Main Widget
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: TColors.secondary,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: TColors.primary,
              )),
          automaticallyImplyLeading: false,
          backgroundColor: TColors.secondary,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -12),
                showBadge: true,
                ignorePointer: false,
                onTap: () => Get.to(() => const AdminNotifications()),
                badgeContent: Text(
                  '3',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: TColors.white),
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: TColors.primary),
                child: const Icon(
                  Iconsax.notification,
                  size: 24,
                  color: TColors.primary,
                ),
              ),
            ),
          ],
          title: Text('Reservations',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: TColors.primary)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: -10),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: TColors.primary,
              ),
              unselectedLabelColor: TColors.accent,
              labelColor: Colors.white,
              splashBorderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              tabs: const [
                Tab(
                  child: Text('Upcoming'),
                ),
                Tab(
                  child: Text('Completed'),
                ),
                Tab(
                  child: Text('Cancelled'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                /// -- 1st tab
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
                  child: const myBooking(),
                ),

                /// -- 2nd tab
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
                  child: const Center(
                    child: myBooking()
                  ),
                ),

                /// -- 3rd tab
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
                  child: Center(
                    child: myBooking(),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 600)
          ],
        ),
      ),
    );
  }
}

class myBooking extends StatelessWidget {
  const myBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          /// Image
          Positioned(
            top: 20,
            left: 20,
            child: ClipOval(
                child: Image.asset(
                  'assets/images/users/userpngtree.png',
                  fit: BoxFit.cover,
                  width: 60,
                )),
          ),

          /// Product & Client
          Positioned(
            top: 26,
            left: 96,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    "Swedish Massage",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(fontSizeDelta: 1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Text('Client: ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(fontSizeDelta: 2)),
                        Text('Jirol Delos Santos',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(fontSizeDelta: -2)),
                      ],
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ],
            ),
          ),

          /// Email
          Positioned(
            top: 95,
            left: 30,
            child: SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Email', style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    'rolcodes07@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeDelta: -2),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          /// Telephone
          Positioned(
            top: 95,
            left: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Telephone',
                    style: Theme.of(context).textTheme.labelMedium),
                Text('09987123543',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeDelta: -2)),
              ],
            ),
          ),

          /// Date
          Positioned(
            top: 95,
            left: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Date', style: Theme.of(context).textTheme.labelMedium),
                Text('6/20/24',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeDelta: -2)),
              ],
            ),
          ),

          /// Time
          Positioned(
            top: 95,
            left: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Time', style: Theme.of(context).textTheme.labelMedium),
                Text('12:00PM',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeDelta: -2)),
              ],
            ),
          ),

          /// Booking ID
          Positioned(
            top: 56,
            left: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('FG2VS1',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: -2, color: TColors.primary)),
                Text('ID', style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          ),

          /// Done button / Check Button
          Positioned(
            right: 5,
            top: 5,
            child: SizedBox(
              width: 45,
              height: 40,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
