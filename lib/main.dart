import 'package:appointment_app/admin/admin_navigation_menu.dart';
import 'package:appointment_app/navigation_menu.dart';
import 'package:appointment_app/new_features/new_navigation_menu.dart';
import 'package:appointment_app/new_features/screen/admin_panel/admin_navigation_menu.dart';
import 'package:appointment_app/new_features/screen/landing_screen/landing_screen.dart';
import 'package:appointment_app/new_features/screen/new_home_screen/new_home_screen.dart';
import 'package:appointment_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'new_features/models/calendar_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: NewNavigationMenu(),
      ),
    );
  }
}
