import 'package:appointment_app/common/widgets/custom%20shapes/containers/TRoundedContainer.dart';
import 'package:appointment_app/features/shop/screens/booking/widget/success_booking.dart';
import 'package:appointment_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../services/shared_pref.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loaders.dart';

class BookingPage extends StatefulWidget {
  BookingPage(
      {super.key,
      required this.service,
      required this.price,
      required this.imageNetwork,
      required this.subtitle});

  final String service;
  final String price;
  final String imageNetwork;
  final String subtitle;

  /// Each user needs to have random booking IDs
  final String bookingId = randomAlphaNumeric(6).toUpperCase();

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? name, email, image, number, id;

  /// Get name, email, image from local storage
  getDataFromSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    id = await SharedPreferenceHelper().getUserID();
    number = await SharedPreferenceHelper().getUserNumber();
    email = await SharedPreferenceHelper().getUserEmail();
    image = await SharedPreferenceHelper().getUserImage();
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

  /// -- Selected Date for Date Button
  DateTime _selectedDate = DateTime.now();

  /// -- Current Date for Referrence
  final String _currentDate = DateFormat("MM-dd-yyyy").format(DateTime.now());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.amberAccent,
                  onPrimary: Colors.white,
                  onSurface: Color.fromRGBO(219, 157, 0, 1),
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(219, 157, 0, 1),
                ))),
            child: child!);
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                // change the border color
                primary: Colors.amberAccent,
                // change the text color
                onSurface: Color.fromRGBO(219, 157, 0, 1),
                onPrimary: Colors.white,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            child: child!);
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  /// Default choice for payment method
  String payment = 'pay on-site';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: TColors.primary,
            )),
        centerTitle: true,
        title: Text(
          'Booking',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: const Color.fromRGBO(219, 157, 0, 1)),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),

          /// Items in Cart
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(15),
                child: TRoundedContainer(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  padding: const EdgeInsets.only(
                      right: 10, left: 5, top: 5, bottom: 5),
                  child:

                      /// Image
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            widget.imageNetwork,
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.service,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(color: TColors.accent, fontSizeDelta: 2),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  widget.subtitle,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    widget.price,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(color: TColors.accent, fontSizeDelta: -2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Coupon Code
              Row(
                children: [
                  Container(
                    width: 265,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextField(
                      decoration: InputDecoration(
                          labelText: 'Enter Coupon Code',
                          prefixIcon: Icon((Iconsax.ticket_discount))),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(219, 157, 0, 60),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Apply',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Booking Computations
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Booking Summary
                    Text(
                      'Booking Summary',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.accent),
                    ),

                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),

                    /// Processing Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Processing Fee',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: TColors.accent)),
                        Text('0',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.accent)),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: TColors.accent)),
                        Text('0',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.accent)),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: TColors.accent)),
                        Text(widget.price,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: TColors.accent)),
                      ],
                    ),

                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),

                    /// Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(color: TColors.accent)),
                        Text(widget.price,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(color: TColors.accent)),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),

              /// -- Coupon Code

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TSectionHeading(
                          title: 'Select Date',
                          showActionButton: false,
                          textColor: TColors.accent),
                      const SizedBox(height: 20),

                      /// Date Picker
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: const Color.fromRGBO(219, 157, 0, 1),
                          child: Container(
                            width: 180,
                            height: 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Iconsax.calendar_add,
                                    color: Color.fromRGBO(219, 157, 0, 1)),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                Text(
                                  '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
                                  style: const TextStyle(
                                      color: Color.fromRGBO(219, 157, 0, 1),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TSectionHeading(
                        title: 'Select Time',
                        showActionButton: false,
                        textColor: TColors.accent,
                      ),
                      const SizedBox(height: 20),

                      /// Time Picker
                      GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: const Color.fromRGBO(219, 157, 0, 1),
                          child: Container(
                            width: 180,
                            height: 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Iconsax.clock,
                                    color: Color.fromRGBO(219, 157, 0, 1)),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                Text(
                                  _selectedTime.format(context),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(219, 157, 0, 1),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              /// -- Payment
              Text('Payment Method',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.accent)),
              const SizedBox(height: 10),

              /// -- Radio Buttons
              Row(
                children: [
                  Radio(
                      activeColor: const Color.fromRGBO(219, 157, 0, 1),
                      value: 'pay on-site',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                  Text('Pay on-site',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(fontSizeDelta: -1)),
                  const SizedBox(width: 10),
                  Radio(
                      activeColor: const Color.fromRGBO(219, 157, 0, 1),
                      value: 'gcash-pay',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                  Image.asset(
                    'assets/icons/payment_methods/gcash_logo.png',
                    width: 80,
                  ),
                  const SizedBox(width: 5),
                  Radio(
                      activeColor: const Color.fromRGBO(219, 157, 0, 1),
                      value: 'apple-pay',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                  Image.asset(
                    'assets/icons/payment_methods/maya_logo_cropped.png',
                    width: 48,
                  ),
                ],
              ),

              const SizedBox(height: 60),

            ],
          ),
        ),
      ),

      /// Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          /// Get user inputs
          onPressed: () async {
            /// -- Map String Dynamic helps you to combine key value pairs and map it into database collections
            /// -- Get user inputs
            Map<String, dynamic> userBookingmap = {
              "Service": widget.service,
              "Price": widget.price,
              "Date":
                  "${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}"
                      .toString(),
              "Time": _selectedTime.format(context).toString(),
              "Username": name,
              "Telephone": number.toString(),
              "Image": image,
              "Email": email,
              "Reference": _currentDate.toString(),
              "Timestamp": Timestamp.now(),
              "Booking ID": widget.bookingId,
              "Account ID": id,
            };

            // /// Upload data to Booking Collections with document name of Booking ID
            // await DatabaseMethods()
            //     .addUserBooking(userBookingmap, widget.bookingId)
            //     .then((value) {
            //   /// SnackBar
            //   TLoaders.successBookingSnackBar(
            //       title: 'Done!', message: 'Your reservation was successful!');
            // });

            /// Function for sub collection of user bookings
            await DatabaseMethods().addUserAccBooking(userBookingmap, id!, widget.bookingId);
            await SharedPreferenceHelper().saveUserBookingId(widget.bookingId);

            /// Another Collection for All Bookings
            // await DatabaseMethods()
            //     .addUserAllBooking(userBookingmap, widget.bookingId);

            await Future.delayed(const Duration(seconds: 1));

            Get.to(() => SuccessBooking(
                  service: widget.service.toString(),
                  price: widget.price.toString(),
                  date:
                      '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
                  time: _selectedTime.format(context),
                  bookingId: widget.bookingId,
                  reference: _currentDate.toString(),
                ));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(219, 157, 0, 50),
              side: const BorderSide(color: Color.fromRGBO(219, 157, 0, 50))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Confirm Booking',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: Colors.white),
              ),
              // SizedBox(width: TSizes.spaceBtwItems / 2),
              // Icon(Iconsax.arrow_right_14),
            ],
          ),
        ),
      ),
    );
  }
}
