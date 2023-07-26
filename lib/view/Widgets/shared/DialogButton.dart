import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:gamesbrowser/core/shared/UINumbers.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {Key? key, this.onPressed, required this.text, this.onLongPress})
      : super(key: key);
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 10,
        ),
        MaterialButton(
          onLongPress: onLongPress,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: AppColors.deepgreen)),
          height: 50,
          padding: const EdgeInsets.all(0),
          minWidth: UINumbers.deviceW / 4,
          color: AppColors.deepgreen,
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 12),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
