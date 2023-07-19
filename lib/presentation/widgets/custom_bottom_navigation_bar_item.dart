import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Widget? picture;
  final VoidCallback? onPressed;
  final String text;
  final bool isEnabled;

  const CustomBottomNavigationBarItem(
      {super.key, this.picture, this.onPressed, required this.text, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          picture ?? const SizedBox(height: 20),
          Text(text,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isEnabled
                      ? AppColors.grayscaleBody
                      : AppColors.disableText))
        ],
      ),
    );
  }
}