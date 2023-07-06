import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class AddressFormField extends StatelessWidget {
  const AddressFormField({
    required this.hintText,
    required this.textEditingController,
    super.key,
    this.maxLines = 1,
    this.readOnly = false,
    this.errorText,
    this.suffix,
  });

  final String hintText;
  final String? errorText;
  final TextEditingController textEditingController;
  final Widget? suffix;
  final int maxLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: textEditingController,
      onSaved: (value) {
        textEditingController.text = value ?? '';
      },
      autofocus: true,
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        isDense: false,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 18,
        ),
        suffixIcon: suffix,
        suffixIconColor: theme.dividerColor,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorText: errorText,
        hintStyle: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
      ),
    );
  }

  OutlineInputBorder get border {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.grey5,
        width: 1.5,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
