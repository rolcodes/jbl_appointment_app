import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../new_features/models/user_model.dart';

class DatabaseMethods {
  /// -- Collection Reference
  final userCollection = FirebaseFirestore.instance.collection('user');
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  /// -- CREATE: create user
  Future addUserDetails(Map<String, dynamic> json) async {
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

  /// -- READ: read user data
  Future<UserModel?> readUser() async {
    /// Create a variable and get current user id

    /// Get single document by ID
    final docUser = FirebaseFirestore.instance.collection('user').doc(uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  /// -- READ: User Appointments
  Future<Stream<QuerySnapshot>> getUserAppointments() async {
    return FirebaseFirestore.instance
        .collection("appointments")
        .where('accountId', isEqualTo: uid)
        .snapshots();
  }

  Future<Future<QuerySnapshot<Map<String, dynamic>>>> ifStatusNotExists() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .where('accountId', isEqualTo: uid)
        .where('status',
            isNotEqualTo: ['Waiting for Approval', 'Approved']).get();
  }

  /// -- READ: Specific User Appointments
  Future<Stream<QuerySnapshot>> getSpecificUserAppointments() async {
    return FirebaseFirestore.instance
        .collection("appointments")
        .where('accountId', isEqualTo: uid)

        /// use multiple objects to find multiple status of appointments
        .where('status',
            whereIn: ['Waiting for approval', 'Approved']).snapshots();
  }

  /// -- READ: Specific Cancelled User Appointments
  Future<Stream<QuerySnapshot>> getSpecificCancelledAppointments() async {
    return FirebaseFirestore.instance
        .collection("appointments")
        .where('accountId', isEqualTo: uid)
        .where('status', isEqualTo: 'Cancelled')
        .snapshots();
  }

  /// -- READ: Specific Completed User Appointments
  Future<Stream<QuerySnapshot>> getSpecificCompletedAppointments() async {
    return FirebaseFirestore.instance
        .collection("appointments")
        .where('accountId', isEqualTo: uid)
        .where('status', isEqualTo: 'Completed')
        .snapshots();
  }

  /// -- READ: Specific Expired User Appointments
  Future<Stream<QuerySnapshot>> getSpecificExpiredAppointments() async {
    return FirebaseFirestore.instance
        .collection("appointments")
        .where('accountId', isEqualTo: uid)
        .where('status', isEqualTo: 'Expired')
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
        .collection('appointments')
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

  /// -- Update status of appointment to Cancelled
  Future<void> updateAdminCancelledStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Cancelled',
    });
  }

  /// -- Update status of appointment to Completed
  Future<void> updateAdminCompletedStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Completed',
    });
  }

  /// -- Update status of appointment to Expired
  Future<void> updateAdminExpiredStatus(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'status': 'Expired',
    });
  }

  /// -- Update/Add cancel reason of Admin
  Future<void> updateAdminReason(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'cancelReason': 'Cancelled by Admin',
    });
  }

  /// -- Update cancel reason to null
  Future<void> updateAdminReasonNull(String bookingId) async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc(bookingId)
        .update({
      'cancelReason': '',
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
