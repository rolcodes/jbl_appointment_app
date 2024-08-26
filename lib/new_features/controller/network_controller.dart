import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jbl/utils/popups/loaders.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      TLoaders.noInternetSnackbar(
          title: 'No Internet',
          message: 'Please turn on wifi or data to proceed');
    }
    else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
