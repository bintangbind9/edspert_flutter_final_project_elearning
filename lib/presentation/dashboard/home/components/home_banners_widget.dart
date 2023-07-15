import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../home_controller.dart';
import '../../../../data/model/banner.dart' as model_banner;

class HomeBannersWidget extends StatelessWidget {
  const HomeBannersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Terbaru',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 145,
            child: controller.isHomeLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.bannerList.length,
                    itemBuilder: (context, index) {
                      model_banner.Banner banner = controller.bannerList[index];

                      return Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              final Uri bannerUrl = Uri.parse(banner.eventUrl!);
                              try {
                                if (!await launchUrl(bannerUrl)) {
                                  Get.snackbar(
                                    'Invalid!',
                                    'Could not open banner.',
                                    backgroundColor: AppColors.warning,
                                  );
                                }
                              } catch (e) {
                                Get.snackbar(
                                  'Invalid!',
                                  'Could not open banner.',
                                  backgroundColor: AppColors.warning,
                                );
                              }
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: Image.network(
                                banner.eventImage!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16)
                        ],
                      );
                    },
                  ),
          ),
        ],
      );
    });
  }
}
