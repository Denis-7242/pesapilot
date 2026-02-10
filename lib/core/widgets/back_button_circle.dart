import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class BackButtonCircle extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonCircle({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed ?? () => Navigator.of(context).pop(),
          borderRadius: BorderRadius.circular(20),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

