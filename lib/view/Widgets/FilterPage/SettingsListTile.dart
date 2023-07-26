import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.text,
    required this.trailText,
    required this.onTap,
  });
  final String text;
  final String trailText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          trailing: Text(
            trailText,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14, color: AppColors.deepgreen),
          ),
        ),
        const Divider(
          color: AppColors.deepGrey,
          indent: 10,
          endIndent: 10,
        )
      ],
    );
  }
}
