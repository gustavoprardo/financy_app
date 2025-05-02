// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: <Widget>[
          SizedBox(height: 60,),
          Expanded(
            flex: 2,
            child: Image.asset('assets/images/logo.png'),
          ),
          Text(
            'Spend Smarter',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: PrimaryButton(text: 'Get Started', onTap: () {}),
          ),
          Text(
            'Already have account? Log In',
            style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

