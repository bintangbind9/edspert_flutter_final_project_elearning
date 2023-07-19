import 'package:edspert_flutter_final_project_elearning/core/constants/asset_images.dart';
import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../widgets/custom_bottom_navigation_bar_item.dart';
import '../widgets/custom_floating_action_button.dart';
import 'dashboard_controller.dart';
import 'discussion/discussion_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndexObs.value;
      return SafeArea(
        child: Scaffold(
          // body: _bodyList()[selectedIndex],
          body: IndexedStack(
            index: selectedIndex,
            children: const [
              HomePage(),
              DiscussionPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: AppColors.grayscaleOffWhite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.06),
                  )
                ]),
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBottomNavigationBarItem(
                    onPressed: () => controller.navigateTo(GeneralValues.indexOfHomePage),
                    text: 'Home',
                    isEnabled: controller.selectedNavIndexObs.value == GeneralValues.indexOfHomePage
                        ? true
                        : false,
                    picture: controller.selectedNavIndexObs.value == GeneralValues.indexOfHomePage
                        ? SvgPicture.asset(AssetImages.iconHomeEnabledSvg)
                        : SvgPicture.asset(AssetImages.iconHomeDisabledSvg)),
                CustomBottomNavigationBarItem(
                    onPressed: () => controller.navigateTo(GeneralValues.indexOfDiscussionPage),
                    text: 'Diskusi Soal',
                    isEnabled: controller.selectedNavIndexObs.value == GeneralValues.indexOfDiscussionPage
                        ? true
                        : false,
                    picture: controller.selectedNavIndexObs.value == GeneralValues.indexOfDiscussionPage
                        ? SvgPicture.asset(AssetImages.iconCardsEnabledSvg)
                        : const SizedBox(height: 24)),
                CustomBottomNavigationBarItem(
                    onPressed: () => controller.navigateTo(GeneralValues.indexOfProfilePage),
                    text: 'Profile',
                    isEnabled: controller.selectedNavIndexObs.value == GeneralValues.indexOfProfilePage
                        ? true
                        : false,
                    picture: controller.selectedNavIndexObs.value == GeneralValues.indexOfProfilePage
                        ? SvgPicture.asset(AssetImages.iconPersonEnabledSvg)
                        : SvgPicture.asset(AssetImages.iconPersonDisabledSvg)),
              ],
            ),
          ),
          /*
          BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              controller.navigateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.quiz), // Icon(Icons.account_balance_outlined)
                label: 'Diskusi Soal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          */
          floatingActionButton: controller.selectedNavIndexObs.value == 1 ? null : CustomFloatingActionButton(onPressed: () => controller.navigateTo(1), child: Image.asset(AssetImages.iconQuizPng)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomePage(),
        const DiscussionPage(),
        const ProfilePage(),
      ];
}