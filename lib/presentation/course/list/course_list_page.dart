import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asset_images.dart';
import '../../../data/model/course.dart';
import '../../../routes/routes.dart';
import '../../exercise/list/exercise_list_page.dart';
import 'course_list_controller.dart';

class CourseListPage extends GetView<CourseListController> {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscaleBackground,
      appBar: AppBar(
        title: const Text('Pilih Pelajaran',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.grayscaleOffWhite,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // return Future<void>.delayed(const Duration(seconds: 3));
          return await controller.getCourses();
        },
        child: GetBuilder<CourseListController>(
          builder: (CourseListController courseController) {
            List<Course> courses = courseController.courseList;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              shrinkWrap: true,
              itemCount: courses.length,
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
                                    color: Color.fromARGB(255, 142, 142, 142))),
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
                              imageUrl:
                                  course.urlCover ?? AssetImages.imgNoImagePng,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.book, color: AppColors.secondary),
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
            );
          },
        ),
      ),
    );
  }
}