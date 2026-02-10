import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/onboarding_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PesaPilot',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
