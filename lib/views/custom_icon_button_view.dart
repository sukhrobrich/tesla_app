import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color borderColor;
  final Color gradientColor1;
  final Color gradientColor2;

  const CustomIconButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.iconColor,
    required this.borderColor,
    required this.gradientColor1,
    required this.gradientColor2,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 49,
        width: 49,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: isSelected ? borderColor : Colors.transparent,
          ),
          color: iconColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(49),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientColor1.withOpacity(0.8), gradientColor2],
          ),
        ),
      ),
      iconSize: 49,
      splashRadius: 1,
    );
  }
}
