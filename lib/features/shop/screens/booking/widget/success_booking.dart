import 'package:appointment_app/navigation_menu.dart';
import 'package:appointment_app/utils/constants/colors.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import '../../../../../services/shared_pref.dart';


class SuccessBooking extends StatefulWidget {
  const SuccessBooking({
    super.key,
    required this.service,
    required this.price,
    required this.date,
    required this.time,
    required this.bookingId, required this.reference,
  });

  final String service, price, date, time, bookingId, reference;

  @override
  State<SuccessBooking> createState() => _SuccessBookingState();
}

class _SuccessBookingState extends State<SuccessBooking> {
  String? name, email, number;

  /// Get name, email, number, & id from local storage
  getDataFromSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    number = await SharedPreferenceHelper().getUserNumber();
    setState(() {});
  }

  getOnTheLoad() async {
    await getDataFromSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 191, 78, 1),
      appBar: AppBar(
        title: Text(
          'Booking Receipt',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.white,
            ),
            onPressed: () => Get.offAll(const NavigationMenu())),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 750,
          child: Stack(
            children: [
              /// -- Custom Clipper
              Positioned(
                top: 470,
                child: ClipPath(
                  clipper: MovieTicketClipper(),
                  child: Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width / 1.1,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20,top: 70),
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      /// -- Null Check: SAFE
                      if (name != null) Text(
                        name!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: const Color.fromRGBO(219, 157, 0, 1)),
                      ),
                      const SizedBox(height: 10),

                      if (number != null) Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        decoration: BoxDecoration(
                            color: TColors.light,
                            borderRadius: BorderRadius.circular(20)),
                        child:  Text(
                          number!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: const Color.fromRGBO(219, 157, 0, 1)),
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (email != null) Text(
                        email!,
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: const Color.fromRGBO(182, 159, 119, 1.0)),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 37,
                left: 182,
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: 42,
                left: 187,
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromRGBO(219, 157, 0, 1)),
                ),
              ),
              const Positioned(
                  top: 49,
                  left: 195,
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 38,
                  )),

              /// -- Receipt Content
              Positioned(
                top: 230,
                left: 20,
                child: Container(
                  height: 430,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Reservation
                          SizedBox(
                            width: 240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Reservation',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(color: TColors.darkGrey)),
                                Text(
                                  widget.service,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontSizeDelta: 4,
                                          color: const Color.fromRGBO(
                                              200, 140, 50, 1)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Price',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: TColors.darkGrey)),
                              Text(widget.price,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontSizeDelta: 4,
                                          color: const Color.fromRGBO(
                                              200, 140, 50, 1))),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      /// -- Date and Time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: TColors.darkGrey)),
                              Text(widget.date,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontSizeDelta: 4,
                                          color: const Color.fromRGBO(
                                              200, 140, 50, 1))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: TColors.darkGrey)),
                              Text(widget.time,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontSizeDelta: 4,
                                          color: const Color.fromRGBO(
                                              200, 140, 50, 1))),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: TColors.darkGrey)),
                              Text('Pay on-site',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontSizeDelta: 4,
                                          color: const Color.fromRGBO(
                                              200, 140, 50, 1))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Booking ID',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: TColors.darkGrey)),
                              Text(widget.bookingId,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontSizeDelta: 4,
                                          color: const Color.fromRGBO(
                                              200, 140, 50, 1))),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Tags and Location
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 20),
                              const SizedBox(width: 5),
                              Text(
                                  'Leonas Bldg. 2nd floor 162 Bucandala –\nAlapan Road, Bucandala IV Imus, Cavite',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(fontSizeDelta: -2),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          Image.asset(
                              'assets/logos/jbl-logo-removebg-preview.png',
                              width: 80),
                        ],
                      ),
                      const SizedBox(height: 15),

                      /// -- Barcode
                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BarcodeWidget(
                              barcode: Barcode.code128(),
                              data: widget.bookingId,
                              drawText: false,
                              width: double.infinity,
                              height: 70,
                            ),
                          ),
                        ),
                      ),

                      /// -- Reference
                      Center(child: Text(widget.reference)),
                    ],
                  ),
                ),
              ),

              Positioned(
                  top: 725,
                  left: 50,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Icon(
                                Icons.file_download_outlined,
                                color: Colors.white,
                                size: 27,
                              ),
                              const SizedBox(width: 5),
                              Text('Download',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(color: Colors.white)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.share_rounded,
                                color: Colors.white),
                            const SizedBox(width: 5),
                            Text('Share',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
