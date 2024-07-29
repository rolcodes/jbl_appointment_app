import 'package:cloud_firestore/cloud_firestore.dart';

class UserBookingModel {
  final String name;
  final String? accountId;
  final String email;
  final String telephone;
  final String? service;
  final String? image;
  final String? duration;
  final String? price;
  final String date;
  final String? time;
  final String staffImage;
  final String staffName;
  final double staffRating;
  final String branchImage;
  final String branchTitle;
  final String branchLocation;
  final String branchContact;
  final String bookingId;
  final String timestamp;

  UserBookingModel({
    required this.name,
    required this.accountId,
    required this.email,
    required this.telephone,
    required this.service,
    required this.image,
    required this.duration,
    required this.price,
    required this.date,
    required this.time,
    required this.staffImage,
    required this.staffName,
    required this.staffRating,
    required this.branchImage,
    required this.branchTitle,
    required this.branchLocation,
    required this.branchContact,
    required this.bookingId,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'accountId': accountId,
        'email': email,
        'telephone': telephone,
        'service': service,
        'image': image,
        'duration': duration,
        'price': price,
        'date': date,
        'time': time,
        'staffImage': staffImage,
        'staffName': staffName,
        'staffRating': staffRating,
        'branchTitle': branchTitle,
        'branchImage': branchImage,
        'branchLocation': branchLocation,
        'branchContact': branchContact,
        'bookingId': bookingId,
        'timestamp': timestamp,
      };

  static UserBookingModel fromJson(Map<String, dynamic> json) =>
      UserBookingModel(
        name: json['name'],
        accountId: json['accountId'],
        email: json['email'],
        telephone: json['telephone'],
        service: json['service'],
        image: json['image'],
        duration: json['duration'],
        price: json['price'],
        date: json['date'],
        time: json['time'],
        staffImage: json['staffImage'],
        staffName: json['staffName'],
        staffRating: json['staffRating'],
        branchTitle: json['branchTitle'],
        branchLocation: json['branchLocation'],
        branchContact: json['branchContact'],
        bookingId: json['bookingId'],
        branchImage: json['branchImage'],
        timestamp: json['timestamp'],
      );
}
