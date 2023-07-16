import 'package:edspert_flutter_final_project_elearning/data/model/arguments/exercise_result_page_args.dart';
import 'package:get/get.dart';

class ExerciseResultController extends GetxController {
  late String resultScore;
  late bool isSuccessGetResult;
  late String getResultMessage;

  @override
  void onInit() {
    super.onInit();

    ExerciseResultPageArgs args = Get.arguments as ExerciseResultPageArgs;
    resultScore = args.resultScore;
    isSuccessGetResult = args.isSuccess;
    getResultMessage = args.message ?? '';
  }
}