import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  PrimaryButton({super.key, this.onTap, required this.text});

  final BorderRadius _borderRadiuns = BorderRadius.all(Radius.circular(24));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: _borderRadiuns,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                onTap != null
                    ? AppColors.greenGradient
                    : AppColors.greyGradient,
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadiuns,
          onTap: onTap,
          child: Align(
            child: Text(
              text,
              style: AppTextStyles.mediumText18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
