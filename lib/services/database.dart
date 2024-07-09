import 'package:appointment_app/services/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  /// -- CREATE: create user
  /// -- Firebase function to add user
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .set(userInfoMap);
  }

  /// -- CREATE: create bookings in database
  /// -- Firebase function for Upcoming Bookings Collection
  Future addUserBooking(
      Map<String, dynamic> userInfoMap, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(bookingId)
        .set(userInfoMap);
  }

  /// -- CREATE: create bookings in another collection in database for All Bookings Screen
  /// -- Firebase function for All Bookings Collection
  Future addUserAllBooking(
      Map<String, dynamic> userInfoMap, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("All Booking")
        .doc(bookingId)
        .set(userInfoMap);
  }

  /// -- CREATE: create Completed Bookings Collection in database
  /// -- Firebase function for Completed Bookings
  Future addCompleteBookings(
      Map<String, dynamic> userInfoMap, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("Completed Booking")
        .doc(bookingId)
        .set(userInfoMap);
  }

  /// -- CREATE: create Cancelled Bookings Collection in database
  /// -- Firebase function for Cancelled Bookings
  Future addCancelledBookings(
      Map<String, dynamic> userInfoMap, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("Cancelled Booking")
        .doc(bookingId)
        .set(userInfoMap);
  }

  /// -- CREATE: create upcoming bookings to user
  Future addUserAccBooking(
      Map<String, dynamic> userInfoMap, String userId, String bookingId) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('myBookings')
        .doc(bookingId)
        .set(userInfoMap);
  }

  /// -- READ: read user appointment then display to My Appointment Screen
  /// -- Getter function for user appointments
  Future<Stream<QuerySnapshot>> getUserAppointments(String email) async {
    return FirebaseFirestore.instance
        .collection("Booking")
        // .orderBy("Date", descending: false)
        .where('Email', isEqualTo: email)
        .snapshots();
  }

  /// -- READ: read bookings then display to Upcoming Bookings Tab
  /// -- Getter function for Upcoming Booking Collection
  Future<Stream<QuerySnapshot>> getBookings() async {
    return FirebaseFirestore.instance
        .collection("Booking")
        .orderBy("Date", descending: false)
        .snapshots();
  }

  /// -- READ: read bookings then display it in All Bookings Screen
  /// -- Getter function for All Booking Collection
  Future<Stream<QuerySnapshot>> getAllBookings() async {
    return FirebaseFirestore.instance
        .collection("All Booking")
        .orderBy("Timestamp", descending: true)
        .snapshots();
  }

  /// -- READ: read completed bookings then display it in Completed Bookings Tab
  /// -- Getter function for All Booking Collection
  Future<Stream<QuerySnapshot>> getCompletedBookings() async {
    return FirebaseFirestore.instance
        .collection("Completed Booking")
        .orderBy("Timestamp", descending: true)
        .snapshots();
  }

  /// -- READ: read completed bookings then display it in Completed Bookings Tab
  /// -- Getter function for All Booking Collection
  Future<Stream<QuerySnapshot>> getCancelledBookings() async {
    return FirebaseFirestore.instance
        .collection("Cancelled Booking")
        .orderBy("Timestamp", descending: true)
        .snapshots();
  }

  /// -- READ: read user myBookings then display it in User Upcoming Bookings Tab
  /// -- Getter function for myBookings Collection
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getUserAccBooking(
      String userId, String bookingId) async {
    return FirebaseFirestore.instance.collectionGroup('mybookings').snapshots();
  }

  /// -- DELETE: delete function for Upcoming Bookings Collection
  Future DeleteBooking(String id) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(id)
        .delete();
  }
}
