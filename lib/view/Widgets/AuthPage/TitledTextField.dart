import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/AuthController.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';

class TitledTextField extends GetView<AuthController> {
  const TitledTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.obscure,
    required this.textEditingController,
  }) : super(key: key);
  final String label;
  final String hint;
  final bool? obscure;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: Theme.of(context).textTheme.bodySmall,
        onTap: () {
          if (textEditingController.selection ==
              TextSelection.fromPosition(TextPosition(
                  offset: textEditingController.text.length - 1))) {
            textEditingController.selection = TextSelection.fromPosition(
                TextPosition(offset: textEditingController.text.length));
          }
        },
        onChanged: (val) => controller.canCheck(),
        controller: textEditingController,
        obscureText: obscure ?? false,
        cursorColor: AppColors.deepGrey,
        decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.grey),
            label: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            prefixIcon: obscure != null
                ? IconButton(
                    onPressed: () => controller.changeCodeState(),
                    icon: Icon(obscure == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    color: AppColors.deepgreen,
                  )
                : null,
            hintText: hint,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.deepGrey),
                borderRadius: BorderRadius.circular(30))));
  }
}
