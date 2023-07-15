import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Container(
      height: 80,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    'Hai, ${controller.currentUser.value.userName ?? ''}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  )),
              const Text('Selamat Datang',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Obx(() => CachedNetworkImage(
                imageUrl: controller.currentUser.value.userFoto ?? '',
                width: 35,
                height: 35,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.person))),
          ),
        ],
      ),
    );
  }
}
