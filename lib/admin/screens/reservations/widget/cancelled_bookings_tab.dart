import 'package:appointment_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class CancelledBookingsTab extends StatefulWidget {
  const CancelledBookingsTab({super.key});

  @override
  State<CancelledBookingsTab> createState() => _CancelledBookingsTabState();
}

class _CancelledBookingsTabState extends State<CancelledBookingsTab> {
  Stream? CancelledBookingStream;

  /// This function allows us to get Completed Booking Details in firebase
  getOnTheLoad() async {
    CancelledBookingStream = await DatabaseMethods().getCancelledBookings();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: CancelledBookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          /// if we have data, get all the docs
          return snapshot.hasData
              ? ListView.builder(
            /// display as a list
            padding: EdgeInsets.zero,
            itemCount: snapshot.data.docs.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return

                ///
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 20,right: 20, top: 20,bottom: 15),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                /// Service
                                SizedBox(
                                  width: 245,
                                  child: Text(
                                    ds["Service"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(fontSizeDelta: 1),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  'Cancelled',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: Colors.red),
                                )
                              ],
                            ),

                            SizedBox(
                                child: Divider(
                                  color: Colors.grey.shade300,
                                )),
                            SizedBox(height: 5),

                            Row(
                              children: [
                                /// Image
                                ClipOval(
                                    child: Image.asset(
                                      ds["Image"],
                                      fit: BoxFit.cover,
                                      width: 40,
                                    )),
                                const SizedBox(width: 15),

                                /// Details
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(ds["Username"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .apply(fontSizeDelta: 2)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          ds["Email"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .apply(fontSizeDelta: -2),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(" • ${ds["Telephone"]}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .apply(fontSizeDelta: -2)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),

                            /// Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                /// Booking ID
                                Row(
                                  children: [
                                    Text('Booking ID: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(ds["Booking ID"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .apply(
                                            fontSizeDelta: -2,
                                            color: TColors.primary)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Date & time
                      Positioned(
                          top: 80,
                          left: 310,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(ds["Date"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(fontSizeDelta: -2)),
                                  Text(ds["Time"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(fontSizeDelta: -2)),
                                ],
                              ),
                            ],
                          ))
                    ]),
                  ),
                );
            },
          )
              : Container();
        });
  }
}
