import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/asset_images.dart';
import '../../../../core/constants/general_values.dart';
import '../../../../data/model/course.dart';
import '../../../../routes/routes.dart';
import '../../../exercise/list/exercise_list_page.dart';
import '../home_controller.dart';

class HomeCoursesWidget extends StatefulWidget {
  const HomeCoursesWidget({Key? key}) : super(key: key);

  @override
  State<HomeCoursesWidget> createState() => _HomeCoursesWidgetState();
}

class _HomeCoursesWidgetState extends State<HomeCoursesWidget> {
  @override
  void initState() {
    super.initState();

    Get.find<HomeController>().getHomeDatas();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        List<Course> courses = controller.courseList;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (courses.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pilih Pelajaran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  if (courses.length > GeneralValues.maxHomeCourseCount)
                    TextButton(
                      child: const Text('Lihat Semua'),
                      onPressed: () {
                        Get.toNamed(Routes.courseList);
                      },
                    ),
                ],
              ),
            if (controller.isHomeLoading == true)
              const Center(child: CircularProgressIndicator())
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courses.length > GeneralValues.maxHomeCourseCount
                    ? GeneralValues.maxHomeCourseCount
                    : courses.length,
                itemBuilder: (context, index) {
                  Course course = courses[index];
                  int? jmlDone = course.jumlahDone;
                  int? jmlMateri = course.jumlahMateri;

                  return Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.courseName ?? 'No Name',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                              Text('$jmlDone/$jmlMateri Paket latihan soal',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 142, 142, 142))),
                              const SizedBox(height: 10)
                            ],
                          ),
                          subtitle: LinearProgressIndicator(
                            value: course.progress!.toDouble(),
                          ),
                          leading: Container(
                            width: 53,
                            height: 53,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 243, 247, 248),
                            ),
                            child: CachedNetworkImage(
                                imageUrl: course.urlCover ??
                                    AssetImages.imgNoImagePng,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.contain),
                          ),
                          onTap: () {
                            Get.toNamed(
                              Routes.exerciseList,
                              arguments: ExerciseListPageArgs(
                                courseId: course.courseId!,
                                courseName: course.courseName ?? '',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
          ],
        );
      },
    );
  }
}