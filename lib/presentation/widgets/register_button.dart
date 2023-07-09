import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color? outlineBorderColor;
  final VoidCallback onPressed;

  const RegisterButton({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.outlineBorderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(46),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(46),
            border: outlineBorderColor != null
                ? Border.all(color: outlineBorderColor!, width: 1)
                : null,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}