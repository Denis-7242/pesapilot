import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/auth_footer.dart';
import 'sign_in_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, -0.8),
              radius: 1.5,
              colors: [AppColors.white, AppColors.white, AppColors.inputBg],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 80),
                _buildLogo(),
                const SizedBox(height: 48),
                _buildBrandMessaging(),
                const SizedBox(height: 48),
                PrimaryButton(
                  text: 'Get Started',
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                const AuthFooter(
                  mainText: 'By continuing, you agree to our',
                  linkText: 'Terms & Privacy Policy',
                  onLinkTap: _handleTermsTap,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: 64,
            color: AppColors.primaryBlue,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.attach_money,
                size: 14,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandMessaging() {
    return Column(
      children: [
        Text('PesaPilot', style: AppTextStyles.h1, textAlign: TextAlign.center),
        const SizedBox(height: 12),
        Text(
          'Take control of your money.',
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textGray),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  static void _handleTermsTap() {
    // Handle terms & privacy policy navigation
  }
}
