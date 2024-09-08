import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jbl/new_features/controller/dependency_injection.dart';
import 'package:jbl/new_features/screen/admin_panel/admin_navigation_menu.dart';
import 'package:jbl/new_features/screen/explore_screen/explore_screen.dart';
import 'package:jbl/services/wrapper.dart';

import 'package:jbl/utils/theme/theme.dart';
import 'package:provider/provider.dart';

import 'new_features/models/calendar_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  /// -- Make sure Firebase.initializeApp
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBr4fsZcZjua-0fpTAwjKPfCAEeIyz42xk",
          appId: "1:8262591029:android:6c7ced8349341bfc32877c",
          messagingSenderId: "8262591029",
          projectId: "appointmentapp-7e48c"),
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarModel(),
      child: GetMaterialApp(
        theme: TAppTheme.lightTheme,
        debugShowCheckedModeBanner: false,

        /// SplashScreen() to begin from the start
        /// Wrapper() to keep user logged in
        home: const Wrapper(),
      ),
    );
  }
}
