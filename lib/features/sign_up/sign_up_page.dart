import 'dart:developer';

import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/custom_textformfield.dart';
import 'package:financy_app/common/widgets/password_formfield.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _controller = SignUpController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder:
              (context) => CustomProgressIndicator(),
        );
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => Scaffold(body: Center(child: Text('Nova tela'))),
          ),
        );
      }
      if (_controller.state is SignUpErrorState) {
        customModalBottomSheet(context);
      }
    });
  }

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
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'your name',
                  hintText: 'your username',
                  validator: Validator.validateName,
                  inputFormatters: [UpperCaseTextFormatter()],
                ),
                CustomTextFormField(
                  keyBoardType: TextInputType.emailAddress,
                  labelText: 'your email',
                  hintText: 'your@email.com',
                  validator: Validator.validateEmail,
                ), // EMAIL
                PasswordFormfield(
                  controller: _passwordController,
                  helperText:
                      'Must have at least 8 character, 1 capital letter and 1 number!',
                  labelText: 'choose your password',
                  hintText: '123456#Abcd',
                  validator: Validator.validatePassword,
                ),
                PasswordFormfield(
                  labelText: 'confirm your password',
                  hintText: '123456#Abcd',
                  validator:
                      (value) => Validator.validateconfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                ),
              ],
            ),
          ), // YOUR NAME
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: PrimaryButton(
              text: 'Sign Up',
              onTap: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.doSignUp();
                } else {
                  // ignore: avoid_print
                  print('erro ao logar');
                }
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
        ],
      ),
    );
  }
}


