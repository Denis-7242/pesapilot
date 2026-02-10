import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/auth_text_field.dart';
import '../../../../core/widgets/back_button_circle.dart';
import '../widgets/auth_footer.dart';
import '../widgets/forgot_password.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenH = media.size.height;
    final bottomInset = media.viewInsets.bottom;

    final double headerTop = math.min(40.0, screenH * 0.06);
    final double headerGap = math.min(32.0, screenH * 0.05);

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(24, 0, 24, bottomInset + 16),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const BackButtonCircle(),
                              SizedBox(height: headerTop),
                              _buildHeader(),
                              SizedBox(height: headerGap),
                              AuthTextField(
                                hintText: 'Email address',
                                prefixIcon: Icons.mail_outline,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                              ),
                              const SizedBox(height: 16),
                              AuthTextField(
                                hintText: 'Password',
                                prefixIcon: Icons.lock_outline,
                                obscureText: _obscurePassword,
                                controller: _passwordController,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20,
                                    color: AppColors.textGray,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              const ForgotPassword(),
                              const Spacer(),
                              const SizedBox(height: 24),
                              PrimaryButton(
                                text: 'Sign In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Handle sign in
                                  }
                                },
                              ),
                              const Spacer(),
                              const SizedBox(height: 16),
                              AuthFooter(
                                mainText: "Don't have an account?",
                                linkText: 'Sign Up',
                                onLinkTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                securityNotice:
                                    'This site is protected by reCAPTCHA',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back!', style: AppTextStyles.h2),
        const SizedBox(height: 8),
        Text(
          'Sign in to continue to your account',
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}
