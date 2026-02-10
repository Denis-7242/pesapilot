import 'package:flutter/material.dart';
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const BackButtonCircle(),
                  const SizedBox(height: 40),
                  _buildHeader(),
                  const SizedBox(height: 32),
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
                  const SizedBox(height: 32),
                  PrimaryButton(
                    text: 'Sign In',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle sign in
                      }
                    },
                  ),
                  const SizedBox(height: 24),
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
                    securityNotice: 'This site is protected by reCAPTCHA',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
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
