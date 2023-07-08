import 'package:edspert_flutter_final_project_elearning/core/constants/constants.dart';
import 'package:edspert_flutter_final_project_elearning/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
              Text('Hello World! Bintang', style: Styles.largeText20),
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
              Image.network(AssetImages.iconHomeEnabledPng),
              Image.network(AssetImages.iconHomeDisabledPng)
            ],
          ),
        ),
      ),
    );
  }
}
