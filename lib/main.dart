import 'dart:io';
import 'package:edspert_flutter_final_project_elearning/core/constants/constants.dart';
import 'package:edspert_flutter_final_project_elearning/core/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          primaryColor: Colors.blue,
          // colorSchemeSeed: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hai! Moh. Bintang Saputra', style: Styles.largeText20),
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
              Image.asset(AssetImages.iconHomeEnabledPng),
              Image.asset(AssetImages.iconHomeDisabledPng)
            ],
          ),
        ),
      ),
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