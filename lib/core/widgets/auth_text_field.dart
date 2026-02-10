import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AuthTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const AuthTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        focusNode: focusNode,
        style: AppTextStyles.input,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: AppTextStyles.input.copyWith(
            color: AppColors.textGray,
          ),
          labelStyle: AppTextStyles.bodyMedium,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 20,
                  color: AppColors.textGray,
                )
              : null,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: AppColors.inputBg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}

