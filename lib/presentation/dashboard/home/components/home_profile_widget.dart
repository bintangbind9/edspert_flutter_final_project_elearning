import 'package:cached_network_image/cached_network_image.dart';
import 'package:edspert_flutter_final_project_elearning/core/constants/general_values.dart';
import 'package:edspert_flutter_final_project_elearning/presentation/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
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
                  Text(
                    'Hai, ${controller.currentUser?.userName ?? ''}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const Text('Selamat Datang',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              ),
              GestureDetector(
                onTap: () => controller.navigateTo(GeneralValues.indexOfProfilePage),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: CachedNetworkImage(
                      imageUrl: controller.currentUser?.userFoto ?? '',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}