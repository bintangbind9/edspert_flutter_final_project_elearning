import 'package:flutter/material.dart';

import '../../../../core/constants/asset_images.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, Altop',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Text('Selamat Datang',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            ],
          ),
          Image.asset(AssetImages.imgProfilePictPng, width: 35, height: 35),
        ],
      ),
    );
  }
}