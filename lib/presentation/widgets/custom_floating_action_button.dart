import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;

  const CustomFloatingActionButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.backgroundColor = AppColors.primary,
    this.borderColor = AppColors.primary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Ink(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: onPressed == null ? AppColors.disable : backgroundColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: onPressed == null ? AppColors.disable : borderColor, width: 1),
            /*
            boxShadow: [BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25)
            )]
            */
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}