
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  /// Save each key locally
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userNumberKey = "USERNUMBERKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageKey = "USERIMAGEKEY";
  static String IMG_KEY = "IMAGE_KEY";
  static String userBookingIdKey = "USERBOOKINGIDKEY";
  static String serviceKey = "SERVICEKEY";
  static String serviceImageKey = "SERVICEIMAGEKEY";
  static String serviceDurationKey = "SERVICEDURATIONKEY";
  static String servicePriceKey = "SERVICEPRICEKEY";
  static String serviceTimeKey = "SERVICETIMEKEY";

  /// -- Save user data locally
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserNumber(String getUserNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNumberKey, getUserNumber);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImageKey, getUserImage);
  }

  Future<bool> saveUserBookingId(String getUserBookingId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userBookingIdKey, getUserBookingId);
  }

  /// -- Save selected service locally

  Future<bool> saveService(String getService) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(serviceKey, getService);
  }

  Future<bool> saveServiceImage(String getServiceImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(serviceImageKey, getServiceImage);
  }

  Future<bool> saveServiceDuration(String getServiceDuration) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(serviceDurationKey, getServiceDuration);
  }

  Future<bool> saveServicePrice(String getServicePrice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(servicePriceKey, getServicePrice);
  }
  Future<bool> saveServiceTime(String getServiceTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(serviceTimeKey, getServiceTime);
  }

  // /// New
  // static Future<bool> saveImageToPreferences(String value) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.setString(IMG_KEY, value);
  // }
  //
  // static Future<String?> getImageFromPreferences() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(IMG_KEY);
  // }

  /// -- Function to upload user data in Firebase Cloud Firestore
  Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getUserNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNumberKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImageKey);
  }

  Future<String?> getUserBookingId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userBookingIdKey);
  }

  /// -- Get selected service locally

  Future<String?> getService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(serviceKey);
  }

  Future<String?> getServiceImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(serviceImageKey);
  }

  Future<String?> getServiceDuration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(serviceDurationKey);
  }

  Future<String?> getServicePrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(servicePriceKey);
  }

  Future<String?> getServiceTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(serviceTimeKey);
  }

  /// -- Remove Function

  Future<String?> removeServiceTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(serviceTimeKey);
  }

  // /// -- Method to convert the image to base64string
  // static String base64String(Uint8List data) {
  //   return base64String(data);
  // }
  //
  // /// -- Function to convert the string to image
  // static Image imagefromBase64String(String base64String) {
  //   return Image.memory(
  //     base64Decode(base64String),
  //     fit: BoxFit.fill,
  //   );
  // }
}
