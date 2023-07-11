import 'package:flutter/material.dart';

import '../../../core/constants/asset_images.dart';
import 'components/home_courses_widget.dart';
import 'components/home_profile_widget.dart';
import 'components/home_top_banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 248),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const HomeProfileWidget(),
          const HomeTopBannerWidget(),
          const SizedBox(height: 25),
          const HomeCoursesWidget(),
          const SizedBox(height: 25),
          const Text(
            'Terbaru',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 145,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    AssetImages.imgTopBannerPng, // Ganti pake yang dinamis!
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    AssetImages.imgTopBannerPng, // Ganti pake yang dinamis!
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _mobileWidget() {
    return Container();
  }

  Widget _tabletWidget() {
    return Container();
  }

  Widget _landscapeWidget() {
    return Container();
  }
}