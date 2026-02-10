import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthFooter extends StatelessWidget {
  final String mainText;
  final String linkText;
  final VoidCallback onLinkTap;
  final String? securityNotice;

  const AuthFooter({
    super.key,
    required this.mainText,
    required this.linkText,
    required this.onLinkTap,
    this.securityNotice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (securityNotice != null) ...[
          const SizedBox(height: 16),
          Text(
            securityNotice!,
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mainText,
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onLinkTap,
              child: Text(
                linkText,
                style: AppTextStyles.link,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

