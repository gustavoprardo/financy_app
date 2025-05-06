import 'dart:async';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(Duration(seconds: 2), navigateToOnboarding);
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoutes.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'financy',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
