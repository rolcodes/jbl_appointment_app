import 'package:appointment_app/new_features/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  /// -- Collection Reference
  final userCollection = FirebaseFirestore.instance.collection('user');
  String uid = FirebaseAuth.instance.currentUser!.uid;

  /// -- CREATE: create user
  Future addUserDetails(Map<String, dynamic> json) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .set(json);
  }

  /// -- CREATE: create bookings in database
  Future addUserBooking(Map<String, dynamic> json, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("appointments")
        .doc(bookingId)
        .set(json); //userInfoMap
  }

  /// -- CREATE: create Appointment History in database
  Future addCancelledAppointment(
      Map<String, dynamic> json, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("cancelled appointment history")
        .doc(bookingId)
        .set(json); //userInfoMap
  }

  //
  // /// -- CREATE: create bookings in another collection in database for All Bookings Screen
  // /// -- Firebase function for All Bookings Collection
  // Future addUserAllBooking(
  //     Map<String, dynamic> userInfoMap, String bookingId) async {
  //   return await FirebaseFirestore.instance
  //       .collection("All Booking")
  //       .doc(bookingId)
  //       .set(userInfoMap);
  // }
  //
  // /// -- CREATE: create Completed Bookings Collection in database
  // /// -- Firebase function for Completed Bookings
  // Future addCompleteBookings(
  //     Map<String, dynamic> userInfoMap, String bookingId) async {
  //   return await FirebaseFirestore.instance
  //       .collection("Completed Booking")
  //       .doc(bookingId)
  //       .set(userInfoMap);
  // }
  //
  // /// -- CREATE: create Cancelled Bookings Collection in database
  // /// -- Firebase function for Cancelled Bookings
  // Future addCancelledBookings(
  //     Map<String, dynamic> userInfoMap, String bookingId) async {
  //   return await FirebaseFirestore.instance
  //       .collection("Cancelled Booking")
  //       .doc(bookingId)
  //       .set(userInfoMap);
  // }

  // /// -- CREATE: create upcoming bookings/appointments to user
  // Future addUserAccBooking(
  //     Map<String, dynamic> userInfoMap, String userId, String bookingId) async {
  //   return await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(userId)
  //       .collection('myBookings')
  //       .doc(bookingId)
  //       .set(userInfoMap);
  // }

  /// -- READ: read user appointment then display to My Appointment Screen
  Future<Stream<QuerySnapshot>> getUserAppointments() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection("appointments")
        //.orderBy("Date", descending: false)
        .where('accountId', isEqualTo: uid)
        .snapshots();
  }

  /// -- READ: read user data
  Future<UserModel?> readUser() async {
    /// Create a variable and get current user id
    String uid = FirebaseAuth.instance.currentUser!.uid;

    /// Get single document by ID
    final docUser = FirebaseFirestore.instance.collection('user').doc(uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  /// -- READ: get user profile information using stream builder
  // Future<Stream<DocumentSnapshot<Map<String, dynamic>>>>
  //     getUserProfileInfo() async {
  //   return FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(uid)
  //       .snapshots();
  // }

  Future<Stream<QuerySnapshot>> getCancelledAppointments() async {
    return FirebaseFirestore.instance
        .collection("cancelled appointment history")
        .where('accountId', isEqualTo: uid)
        .snapshots();
  }

  /// -- READ: get all requests appointments where status is 'Waiting for approval'
  Future<Stream<QuerySnapshot>> getAdminRequestAppointments() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        //.orderBy("timestamp", descending: true)
        .where('status', isEqualTo: 'Waiting for approval')
        //.orderBy("Date", descending: false)
        .snapshots();
  }

  /// -- READ: get all approved appointments where status is 'Approved'
  Future<Stream<QuerySnapshot>> getAdminApprovedAppointments() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .where('status', isEqualTo: 'Approved')
        .snapshots();
  }

  /// -- READ: get all cancelled appointments where status is 'Cancelled'
  Future<Stream<QuerySnapshot>> getAdminCancelledAppointments() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .where('status', isEqualTo: 'Cancelled')
        .snapshots();
  }

  /// -- READ: get all completed appointments where status is 'Completed'
  Future<Stream<QuerySnapshot>> getAdminCompletedAppointments() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .where('status', isEqualTo: 'Completed')
        .snapshots();
  }

  /// -- READ: get all expired appointments where status is 'Expired'
  Future<Stream<QuerySnapshot>> getAdminExpiredAppointments() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .where('status', isEqualTo: 'Expired')
        .snapshots();
  }

  // /// -- READ: read bookings then display to Upcoming Bookings Tab
  // /// -- Getter function for Upcoming Booking Collection
  // Future<Stream<QuerySnapshot>> getBookings() async {
  //   return FirebaseFirestore.instance
  //       .collection("Booking")
  //       .orderBy("Date", descending: false)
  //       .snapshots();
  // }

  // /// -- READ: read bookings then display it in All Bookings Screen
  // /// -- Getter function for All Booking Collection
  // Future<Stream<QuerySnapshot>> getAllBookings() async {
  //   return FirebaseFirestore.instance
  //       .collection("All Booking")
  //       .orderBy("Timestamp", descending: true)
  //       .snapshots();
  // }
  //
  // /// -- READ: read completed bookings then display it in Completed Bookings Tab
  // /// -- Getter function for All Booking Collection
  // Future<Stream<QuerySnapshot>> getCompletedBookings() async {
  //   return FirebaseFirestore.instance
  //       .collection("Completed Booking")
  //       .orderBy("Timestamp", descending: true)
  //       .snapshots();
  // }
  //
  // /// -- READ: read completed bookings then display it in Completed Bookings Tab
  // /// -- Getter function for All Booking Collection
  // Future<Stream<QuerySnapshot>> getCancelledBookings() async {
  //   return FirebaseFirestore.instance
  //       .collection("Cancelled Booking")
  //       .orderBy("Timestamp", descending: true)
  //       .snapshots();
  // }

  // /// -- READ: read user myBookings then display it in User Upcoming Bookings Tab
  // /// -- Getter function for myBookings Collection
  // Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getUserAccBooking(
  //     String userId, String bookingId) async {
  //   return FirebaseFirestore.instance.collectionGroup('mybookings').snapshots();
  // }

  /// -- UPDATE: update user appointments
  Future<void> updateUserAppointments(
      String bookingId, String newDate, String newTime, String newStaff) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'date': newDate,
      'time': newTime,
      'staffName': newStaff,
    });
  }

  /// -- Update appointment, add Cancel Reason
  Future<void> updateUserCancelledAppointments(
      String bookingId, String selectedFeedback) async {
    return FirebaseFirestore.instance
        .collection('cancelled appointment history')
        .doc(bookingId)
        .update({
      'cancelReason': selectedFeedback,
    });
  }

  /// -- Update appointment, add status
  Future<void> updateAppointmentStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Waiting for approval',
    });
  }

  /// -- Update status of appointment to Approved
  Future<void> updateAdminApprovedStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Approved',
    });
  }

  /// -- Update status of appointment to Approved
  Future<void> updateAdminCancelledStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Cancelled',
    });
  }

  Future<void> updateAdminCompletedStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Completed',
    });
  }

  /// -- DELETE: delete function for Upcoming Bookings Collection
  Future deleteBooking(String id) async {
    return await FirebaseFirestore.instance
        .collection("appointments")
        .doc(id)
        .delete();
  }
}
