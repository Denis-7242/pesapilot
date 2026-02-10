import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class ForgotPassword extends StatelessWidget {
  final VoidCallback? onTap;

  const ForgotPassword({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Forgot Password?',
          style: AppTextStyles.link,
        ),
      ),
    );
  }
}

