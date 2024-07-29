import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminRequestAppointmentItem extends StatelessWidget {
  const AdminRequestAppointmentItem({super.key, required this.ds, required this.onSelectedAllRequestAppointment});

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAllRequestAppointment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedAllRequestAppointment,
      child: Container(
        height: 192,
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: TColors.light,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    ds["service"],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontSizeDelta: 1, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Waiting for approval',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(fontSizeDelta: -2,color: Colors.blue),
                )
              ],
            ),
            SizedBox(
                child: Divider(
                  color: Colors.grey.shade300,
                )),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      ds["image"],
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                    )),
                Container(
                  padding: EdgeInsets.only(left: 12),
                  width: 240,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ds['branchTitle'],
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Schedule:',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                          Text(
                            "${ds['date']}, ${ds['time']}",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Technician:",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.darkGrey),
                          ),
                          Text(
                            ds['staffName'],
                            style:
                            Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.darkGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking ID: ",
                            style:
                            Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.darkGrey,
                            ),
                          ),
                          Text(
                            ds['bookingId'],
                            style:
                            Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.darkGrey,
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Text(
                          'Price:  ${ds["price"]}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(fontSizeDelta: 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
