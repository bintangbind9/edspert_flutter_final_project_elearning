import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/course.dart';
import '../../../routes/routes.dart';
import '../../exercise/list/exercise_list_page.dart';
import 'course_list_controller.dart';

class CourseListPage extends GetView<CourseListController> {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Pelajaran'),
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
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.exerciseList,
                      arguments: ExerciseListPageArgs(
                        courseId: courses[index].courseId ?? '',
                        courseName: courses[index].courseName ?? '',
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.abc),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(courses[index].courseName ?? ''),
                              if (courses[index].jumlahMateri! > 0)
                                Text(
                                  '${courses[index].jumlahDone}/${courses[index].jumlahMateri} Paket Latihan Soal',
                                ),
                              if (courses[index].jumlahMateri! > 0)
                                LinearProgressIndicator(
                                  value: (courses[index].jumlahDone!) / (courses[index].jumlahMateri!),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                /* Dead Code
                return ListTile(
                  title: Text(courses[index].courseName ?? ''),
                  onTap: () {
                    Get.toNamed(
                      Routes.exerciseList,
                      arguments: ExerciseListPageArgs(
                        courseId: courses[index].courseId!,
                        courseName: courses[index].courseName ?? '',
                      ),
                    );
                  },
                );
                */
              },
            );
          },
        ),
      ),
    );
  }
}