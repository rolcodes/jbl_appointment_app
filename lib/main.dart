import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jbl/splash_screen.dart';
import 'package:jbl/utils/theme/theme.dart';
import 'package:provider/provider.dart';

import 'new_features/models/calendar_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: const FirebaseOptions(
        apiKey: "current_key",
        appId: "mobilesdk_app_id",
        messagingSenderId: "project_number",
        projectId: "project_id"),
  );
  runApp(const MyApp());
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
        home: const SplashScreen(),
      ),
    );
  }
}
