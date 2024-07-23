import 'package:appointment_app/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class MyAppointmentItem extends StatelessWidget {
  const MyAppointmentItem({
    super.key,
    required this.ds, required this.onSelectedAppointment,
  });

  final DocumentSnapshot<Object?> ds;
  final void Function() onSelectedAppointment;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: TColors.light,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onSelectedAppointment,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  ds['image'],
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SizedBox(
                  width: 240,
                  height: 110,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Service Start Time: ${ds["time"]}, ${ds["date"]}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(
                              color: Colors.pinkAccent
                                  .shade700,fontSizeDelta: -1), maxLines: 1,),
                      SizedBox(
                        width: 190,
                        child: Text(
                          ds["branchTitle"],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(
                              heightDelta: -0.2,
                              color: TColors.primary),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Text(
                      //     'Location:  ${ds["Branch Location"]}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .labelLarge!),
                      SizedBox(
                        width: 200,
                        child: Text(
                          ds["service"],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'Technician:  ${ds["staffName"]}',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(
                            color: TColors.darkGrey),
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