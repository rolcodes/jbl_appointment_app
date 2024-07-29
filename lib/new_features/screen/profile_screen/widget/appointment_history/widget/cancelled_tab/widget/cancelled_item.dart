import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../utils/constants/colors.dart';

class CancelledItem extends StatelessWidget {
  const CancelledItem({
    super.key,
    required this.ds,
    required this.onSelectedCancelledAppointment,
  });

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedCancelledAppointment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: InkWell(
        onTap: onSelectedCancelledAppointment,
        child: Container(
          clipBehavior: Clip.none,
          height: 245,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: TColors.light,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                offset: Offset(0, 2),
                blurRadius: 6,
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 240,
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
                    'Cancelled',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(fontSizeDelta: -2,color: Colors.red),
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
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cancelled by customer.',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      'Reason: ${ds['cancelReason']}',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
