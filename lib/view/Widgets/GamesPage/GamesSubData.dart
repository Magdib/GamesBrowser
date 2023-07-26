import 'package:flutter/material.dart';

class GamesSubData extends StatelessWidget {
  const GamesSubData(
      {super.key, required this.icon, required this.text, required this.color});
  final IconData icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
