import 'dart:developer';

import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:flutter/material.dart';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 60),
          Expanded(flex: 2, child: Image.asset('assets/images/logo.png')),
          Text(
            textAlign: TextAlign.center,
            'Spend Smarter',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'Save More',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: PrimaryButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  NamedRoutes.signUp,
                );
              },
            ),
          ),
          MultiTextButton(
            onPressed: () => log('tap'),
            children: [
              Text(
                'Already have account? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Log in ',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greenLightOne,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
