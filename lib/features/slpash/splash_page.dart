import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/features/slpash/splash_controller.dart';
import 'package:financy_app/features/slpash/splash_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _slpashController = locator.get<SplashController>();
  @override
  void initState() {
    super.initState();
    _slpashController.isUserLogged();
    _slpashController.addListener(() {
      if(_slpashController.state is SplashSuccessState){
        // call home
        log('navegar para home');
      } else {
        // call onboarding
        log('navegar para onboarding');
      }
    });
  }

  @override
  void dispose() {
    _slpashController.dispose();
    super.dispose();
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
