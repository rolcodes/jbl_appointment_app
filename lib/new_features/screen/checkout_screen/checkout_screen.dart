import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbl/utils/device/device_utility.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

import '../../../common/widgets/appbar/custom_appbar/custom_appbar.dart';
import '../../../services/database.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_screen_ratio.dart';
import '../../../utils/popups/loaders.dart';
import '../../models/branch_model.dart';
import '../../models/calendar_model.dart';
import '../../models/data/branch_data.dart';
import '../../models/service_product.dart';
import '../../models/staff_model.dart';
import '../../models/user_booking_model.dart';
import '../../new_navigation_menu.dart';
import '../select_staff/widget/custom_rating_bar_indicator.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({
    super.key,
    required this.service,
    required this.staff,
  });

  final ServiceProduct service;
  final StaffModel staff;

  // final BranchClass branch;

  /// Each user booking needs to have random booking IDs
  final String bookingId = randomAlphaNumeric(6).toUpperCase();

  /// Each user needs to have random user IDs
  // final String id = randomAlphaNumeric(6).toUpperCase();

  @override
  State<CheckoutScreen> createState() =>
      _CheckoutScreenState(branch: dummyBranch);
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  /// Variables
  String? title,
      image,
      duration,
      //name,
      price,
      time,
      removeTime,
      email,
      userImage,
      number;

  // String timestamp = DateFormat('M - d - yyyy').format(DateTime.now());

  // final DateTime timestamp = DateTime.now();

  final String _currentDate = DateFormat("MM-dd-yyyy").format(DateTime.now());

  /// Create a variable and get current user id
  String uid = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController pickedDate = TextEditingController();

  /// Created a required constructor for this variable
  final List<BranchClass> branch;

  _CheckoutScreenState({required this.branch});

  /// Get data in local database
  getDataFromSharedPref() async {
    /// user data
    //name = await SharedPreferenceHelper().getUserName();
    // id = await SharedPreferenceHelper().getUserID();
    number = await SharedPreferenceHelper().getUserNumber();
    email = await SharedPreferenceHelper().getUserEmail();
    userImage = await SharedPreferenceHelper().getUserImage();

    /// service data
    title = await SharedPreferenceHelper().getService();
    image = await SharedPreferenceHelper().getServiceImage();
    duration = await SharedPreferenceHelper().getServiceDuration();
    price = await SharedPreferenceHelper().getServicePrice();
    time = await SharedPreferenceHelper().getServiceTime();
    removeTime = await SharedPreferenceHelper().removeServiceTime();
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
    /// -- List to selected data, and update to text controller
    /// -- Listen to picked date and update to text controller
    pickedDate.text = DateFormat('MMM d') // EEEE, MMM d, yyyy
        .format(Provider.of<CalendarModel>(context, listen: true)
            .firstDate); //.add_yMd()

    final isMobileSmall = CustomScreen.isMobileSmallWidth(context);
    final isMobileMedium = CustomScreen.isMobileMediumWidth(context);

    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomAppBar(
        isEdit: false,
        showBackgroundColor: false,
        showIcon: true,
        isDrawer: false,
        isNotification: false,
        iconColor: TColors.primary,
        title:
            Text('Checkout', style: Theme.of(context).textTheme.headlineSmall),
        isCenterTitle: true,
      ),
      body:

          /// -- Apply Future Builder to access user information in Firebase and
          /// include user info inside appointments document fields
          FutureBuilder(
              future: DatabaseMethods().readUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;

                  return user == null
                      ? Container()
                      : SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: isMobileSmall
                                ? TDeviceUtils.getScreenHeight() / 1.11
                                : TDeviceUtils.getScreenHeight() / 1.09,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: TColors.primary.withOpacity(0.5),
                            ),
                            child: Container(
                              height: TDeviceUtils.getScreenHeight(),
                              decoration: BoxDecoration(
                                  color: TColors.light,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                        spreadRadius: 2)
                                  ]),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          if (image != null)
                                            ClipOval(
                                              child: Image.network(
                                                image!,
                                                width: isMobileSmall
                                                    ? 75
                                                    : isMobileMedium
                                                        ? 80
                                                        : 90,
                                                height: isMobileSmall
                                                    ? 75
                                                    : isMobileMedium
                                                        ? 80
                                                        : 90,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            height: isMobileSmall
                                                ? 75
                                                : isMobileMedium
                                                    ? 80
                                                    : 90,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (title != null)
                                                  SizedBox(
                                                    width: isMobileSmall
                                                        ? 190
                                                        : isMobileMedium
                                                            ? 190
                                                            : 200,
                                                    child: Text(
                                                      title!,
                                                      style: isMobileSmall
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .titleLarge!
                                                              .apply(
                                                                  fontSizeDelta:
                                                                      -2)
                                                          : isMobileMedium
                                                              ? Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleLarge!
                                                                  .apply(
                                                                      fontSizeDelta:
                                                                          -1)
                                                              : Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleLarge,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                if (duration != null)
                                                  Text(duration!,
                                                      style: isMobileSmall
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .titleSmall!
                                                              .apply(
                                                                  fontSizeDelta:
                                                                      -3)
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .titleSmall),
                                                if (price != null)
                                                  Text(price!,
                                                      style: isMobileSmall
                                                          ? Theme.of(context)
                                                              .textTheme
                                                              .titleSmall!
                                                              .apply(
                                                                  fontSizeDelta:
                                                                      -3)
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .titleSmall),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                      height: 10, color: TColors.primary),
                                  SizedBox(height: 20),

                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              /// -- Date
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: TColors.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  'Date',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .apply(
                                                          color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                pickedDate.text,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              /// -- Time
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: TColors.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  'Time',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .apply(
                                                          color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              if (time != null)
                                                Text(time!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  const Divider(
                                      height: 10, color: TColors.primary),
                                  SizedBox(height: 10),

                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'Your choosen staff',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .apply(
                                                    color: TColors.primary,
                                                    fontSizeDelta: 2),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: isMobileSmall
                                                  ? 20
                                                  : isMobileMedium
                                                      ? 25
                                                      : 40),
                                          child: Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  widget.staff.image,
                                                  width: 70,
                                                  height: 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 40),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        " ${widget.staff.staffName}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                    TRatingBarIndicator(
                                                        rating: widget
                                                            .staff.rating),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Divider(
                                      height: 10, color: TColors.primary),
                                  SizedBox(height: 20),

                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'Branch',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .apply(
                                                    color: TColors.primary,
                                                    fontSizeDelta: 2),
                                          ),
                                        ),
                                        SizedBox(
                                            height: isMobileSmall ? 0 : 10),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: isMobileSmall
                                                  ? 20
                                                  : isMobileMedium
                                                      ? 25
                                                      : 40),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  ClipOval(
                                                    child: Image.network(
                                                      branch[0].image,
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 55),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 33),
                                                      child: SizedBox(
                                                        width: isMobileSmall
                                                            ? 180
                                                            : 200,
                                                        child: Text(
                                                          branch[0].title,
                                                          style: isMobileSmall
                                                              ? Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .apply(
                                                                      fontSizeDelta:
                                                                          -1)
                                                              : Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .apply(
                                                                      fontSizeDelta:
                                                                          -2),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.location_on,
                                                            color: TColors
                                                                .primary),
                                                        const SizedBox(
                                                            width: 10),
                                                        SizedBox(
                                                            width: isMobileSmall
                                                                ? 180
                                                                : 200,
                                                            child: Text(
                                                              branch[0]
                                                                  .location,
                                                              style: isMobileSmall
                                                                  ? Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .apply(
                                                                          fontSizeDelta:
                                                                              -2)
                                                                  : Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium,
                                                              maxLines: 4,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.call,
                                                            color: TColors
                                                                .primary),
                                                        const SizedBox(
                                                            width: 10),
                                                        SizedBox(
                                                          width: isMobileSmall
                                                              ? 180
                                                              : 200,
                                                          child: Text(
                                                            branch[0].contact,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                            maxLines: 4,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: isMobileSmall
                                          ? 5
                                          : isMobileMedium
                                              ? 8
                                              : 10),
                                  const Divider(
                                      height: 10, color: TColors.primary),
                                  SizedBox(
                                      height: isMobileSmall
                                          ? 10
                                          : isMobileMedium
                                              ? 15
                                              : 20),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons
                                                              .monetization_on_outlined,
                                                          color:
                                                              TColors.primary),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        'JBL Deals',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30),
                                                      tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      minimumSize:
                                                          const Size(50, 30),
                                                    ),
                                                    child: Text(
                                                      'Apply Deals',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .apply(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Total Fee: ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge),
                                                  if (price != null)
                                                    Text(price!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge)
                                                ],
                                              ),
                                              // Text("${TDeviceUtils.getScreenWidth(context)}",
                                              //     style: Theme.of(context)
                                              //         .textTheme
                                              //         .titleLarge),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) =>
                                                  CupertinoAlertDialog(
                                                title: Text(
                                                  'Confirm Booking',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Text(
                                                    'Heads up! Your chosen technician will be considered but it is not guaranteed.',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge,
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    style: TextButton.styleFrom(
                                                        overlayColor:
                                                            TColors.primary),
                                                    child: Text(
                                                      'Cancel',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .apply(
                                                              color: TColors
                                                                  .darkerGrey),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      /// -- Map String Dynamic helps you to combine key value pairs and map it into database collections
                                                      /// -- Get user inputs
                                                      // Map<String, dynamic>
                                                      //     userBookingMap = {
                                                      //   "Username": user.name,
                                                      //   // Data from Firebase
                                                      //   "Account ID": id,
                                                      //   "email": user.email,
                                                      //   // Data from Firebase
                                                      //   "Telephone": user.telephone,
                                                      //   // Data from Firebase
                                                      //   // "User Image": userImage,
                                                      //   "Service": title,
                                                      //   "Image": image,
                                                      //   "Duration": duration,
                                                      //   "Price": price,
                                                      //   "Date": pickedDate.text,
                                                      //   "Time": time,
                                                      //   "Staff Image": widget.staff.image,
                                                      //   "Staff Name":
                                                      //       widget.staff.staffName,
                                                      //   "Staff Rating":
                                                      //       widget.staff.rating,
                                                      //   "Branch Image": branch[0].image,
                                                      //   "Branch Title": branch[0].title,
                                                      //   "Branch Location":
                                                      //       branch[0].location,
                                                      //   "Branch Contact":
                                                      //       branch[0].contact,
                                                      //   "Booking ID": widget.bookingId,
                                                      // };

                                                      final userBooking =
                                                          UserBookingModel(
                                                        name: user.name,
                                                        accountId: uid,
                                                        email: user.email,
                                                        telephone:
                                                            user.telephone,
                                                        service: title,
                                                        image: image,
                                                        duration: duration,
                                                        price: price,
                                                        date: pickedDate.text,
                                                        time: time,
                                                        staffImage:
                                                            widget.staff.image,
                                                        staffName: widget
                                                            .staff.staffName,
                                                        staffRating:
                                                            widget.staff.rating,
                                                        branchImage:
                                                            branch[0].image,
                                                        branchTitle:
                                                            branch[0].title,
                                                        branchLocation:
                                                            branch[0].location,
                                                        branchContact:
                                                            branch[0].contact,
                                                        bookingId:
                                                            widget.bookingId,
                                                        timestamp: _currentDate,
                                                        cancelReason: '',
                                                      );
                                                      final json =
                                                          userBooking.toJson();

                                                      /// Upload data to Booking Collections with document name of Booking ID
                                                      await DatabaseMethods()
                                                          .addUserBooking(json,
                                                              widget.bookingId)
                                                          .then((value) {
                                                        /// SnackBar
                                                        TLoaders.successSnackBar(
                                                            title: 'Done!',
                                                            message:
                                                                'Your reservation was successful!');
                                                      });

                                                      /// -- Add update status in document field using update function
                                                      /// -- Set status to Waiting for approval
                                                      await DatabaseMethods()
                                                          .updateAppointmentStatus(
                                                              widget.bookingId);

                                                      await Future.delayed(
                                                          const Duration(
                                                              seconds: 1));

                                                      /// Remove selected/saved time, to generate new time for new appointment
                                                      SharedPreferenceHelper()
                                                          .removeServiceTime();

                                                      Get.to(() =>
                                                          const NewNavigationMenu());
                                                    },
                                                    style: TextButton.styleFrom(
                                                        overlayColor:
                                                            TColors.primary),
                                                    child: Text(
                                                      'Book',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .apply(
                                                              fontSizeDelta: -1,
                                                              color: CupertinoColors
                                                                  .activeBlue),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Center(
                                              child: Text(
                                                'Submit',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .apply(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // /// -- Apply Future Builder to access user information in Firebase Database
                                  // FutureBuilder(
                                  //     future: DatabaseMethods().readUser(),
                                  //     builder: (context, snapshot) {
                                  //       if (snapshot.hasData) {
                                  //         final user = snapshot.data;
                                  //
                                  //         return user == null
                                  //             ? Container()
                                  //             :
                                  //       }
                                  //
                                  //       return Container();
                                  //     }),
                                ],
                              ),
                            ),
                          ),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: TColors.primary,
                  ),
                );
              }),
    );
  }
}
