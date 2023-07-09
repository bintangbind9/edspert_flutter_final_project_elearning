import 'dart:io';
import 'package:edspert_flutter_final_project_elearning/core/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E Learning',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          primaryColor: AppColors.primary,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Pages.pages
    );
  }
}

/// To handle Error: HandshakeException: Handshake error in client (OS Error: CERTIFICATE_VERIFY_FAILED: certificate has expired(handshake.cc:393))
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}