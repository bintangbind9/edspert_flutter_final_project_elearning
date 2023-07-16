import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import 'components/home_banners_widget.dart';
import 'components/home_courses_widget.dart';
import 'components/home_profile_widget.dart';
import 'components/home_top_banner_widget.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return Scaffold(
      backgroundColor: AppColors.grayscaleBackground,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HomeProfileWidget(),
          HomeTopBannerWidget(),
          SizedBox(height: 25),
          HomeCoursesWidget(),
          SizedBox(height: 25),
          HomeBannersWidget()
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