import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  const CommonButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.textColor = AppColors.grayscaleOffWhite,
    this.backgroundColor = AppColors.primary,
    this.borderColor = AppColors.primary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: onPressed == null ? AppColors.disable : backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: onPressed == null ? AppColors.disable : borderColor, width: 1),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: onPressed == null ? AppColors.disableText : textColor,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}