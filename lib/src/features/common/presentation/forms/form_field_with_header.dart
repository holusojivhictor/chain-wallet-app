import 'package:chain_wallet_mobile/src/features/common/presentation/forms/custom_form_field.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

class FormFieldWithHeader extends StatefulWidget {
  const FormFieldWithHeader({
    required this.controller,
    required this.textInputType,
    required this.headerText,
    required this.hintText,
    super.key,
    this.autoValidate = false,
    this.hasTrailing = true,
    this.suffixIcon,
    this.errorText,
    this.hintStyle,
    this.trailing,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.obscure,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final Validator validator;
  final String headerText;
  final String hintText;
  final String? errorText;
  final TextStyle? hintStyle;
  final Widget? trailing;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool hasTrailing;
  final bool autoValidate;
  final bool? obscure;

  @override
  State<FormFieldWithHeader> createState() => _FormFieldWithHeaderState();
}

class _FormFieldWithHeaderState extends State<FormFieldWithHeader> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return Container(
      margin: Styles.formFieldMargin,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.headerText,
                  style: theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
                ),
                if (widget.hasTrailing)
                  GestureDetector(
                    onTap: () => setState(() => obscureText = !obscureText),
                    child: Text(
                      obscureText ? s.show : s.hide,
                      style: theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
                    ),
                  ),
                if (widget.trailing != null) widget.trailing!
              ],
            ),
          ),
          CustomFormField(
            textEditingController: widget.controller,
            obscureText: widget.obscure ?? obscureText,
            textInputType: widget.textInputType,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            suffixIcon: widget.suffixIcon,
            errorText: widget.errorText,
            onChanged: (_) => setState(() {}),
            autoValidate: widget.autoValidate,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
