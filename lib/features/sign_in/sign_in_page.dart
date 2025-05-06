import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/custom_textformfield.dart';
import 'package:financy_app/common/widgets/password_formfield.dart';
import 'package:financy_app/features/sign_in/sign_in_controller.dart';
import 'package:financy_app/features/sign_in/sign_in_state.dart';
import 'package:financy_app/services/mock_auth_service.dart';
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

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignIpPageState();
}

class _SignIpPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = SignInController(MockAuthService());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showDialog(
          context: context,
          builder: (context) => CustomProgressIndicator(),
        );
      }
      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => Scaffold(body: Center(child: Text('Nova tela'))),
          ),
        );
      }
      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          content: error.message,
          buttonText: 'Tentar novamente',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Welcome Back ',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightTwo,
            ),
          ),
          Image.asset('assets/images/logo_log_in.png'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  keyBoardType: TextInputType.emailAddress,
                  labelText: 'your email',
                  hintText: 'your@email.com',
                  validator: Validator.validateEmail,
                ), // EMAIL
                PasswordFormfield(
                  controller: _passwordController,
                  labelText: 'your password',
                  hintText: '123456#Abcd',
                  validator: Validator.validatePassword,
                ),
              ],
            ),
          ), // YOUR NAME
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: PrimaryButton(
              text: 'Log in',
              onTap: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  // ignore: avoid_print
                  print('erro ao logar');
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () => Navigator.popAndPushNamed(context, NamedRoutes.signUp),
            children: [
              Text(
                'Don\'t have a have account? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Sign Up ',
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
