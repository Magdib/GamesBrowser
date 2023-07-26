import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 17),
      disabledColor: AppColors.grey,
      minWidth: MediaQuery.of(context).size.width - 30,
      color: AppColors.deepgreen,
      onPressed: onPressed,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.white)),
    );
  }
}
