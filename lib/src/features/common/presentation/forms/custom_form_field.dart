import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
typedef OnChanged = void Function(String);

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    super.key,
    this.autoValidate = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.errorText,
    this.maxLength,
    this.maxLines,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Validator? validator;
  final OnChanged? onChanged;
  final String? errorText;
  final bool autoValidate;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      controller: textEditingController,
      obscureText: obscureText,
      onSaved: (value) {
        textEditingController.text = value ?? '';
      },
      maxLines: obscureText ? 1 : maxLines,
      onChanged: onChanged,
      validator: validator,
      keyboardType: textInputType,
      maxLength: maxLength,
      decoration: InputDecoration(
        counter: maxLength != null ? const Offstage() : null,
        isDense: false,
        contentPadding: Styles.formFieldPadding,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: Styles.formFieldBorder,
        enabledBorder: Styles.formFieldBorder,
        focusedBorder: Styles.focusedFormFieldBorder,
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge!
            .copyWith(color: AppColors.grey5, fontSize: 15),
      ),
    );
  }
}
