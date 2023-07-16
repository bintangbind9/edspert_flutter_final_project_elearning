class ExerciseResultPageArgs {
  final String resultScore;
  final bool isSuccess;
  final String? message;

  const ExerciseResultPageArgs({
    required this.resultScore,
    required this.isSuccess,
    this.message
  });
}