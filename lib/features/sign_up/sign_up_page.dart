// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:financy_app/common/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Start Saving ',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Text(
            'Your Money ',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Image.asset('assets/images/logo_sign_up.png'),
          Form(child: Column(children: [CustomTextFormField(
            labelText: 'your name',
            hintText: 'your@email.com',

          )])),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: PrimaryButton(text: 'Sign Up', onTap: () {}),
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
        ],
      ),
    );
  }
}


