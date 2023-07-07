import 'package:flutter/material.dart';

class AmountFormField extends StatelessWidget {
  const AmountFormField({
    required this.hintText,
    required this.textEditingController,
    super.key,
    this.maxLines = 1,
    this.hasPrefix = false,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final int maxLines;
  final bool hasPrefix;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.headlineSmall!.copyWith(
      fontSize: 40,
      fontWeight: FontWeight.w400,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: textEditingController,
        onSaved: (value) {
          textEditingController.text = value ?? '';
        },
        autofocus: true,
        maxLines: maxLines,
        style: style,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: false,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: style.copyWith(
            color: Colors.grey,
          ),
          prefix: hasPrefix
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(r'$', style: style),
                )
              : null,
        ),
      ),
    );
  }
}
