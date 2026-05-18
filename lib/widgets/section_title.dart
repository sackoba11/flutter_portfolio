import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.actionLabel,
    required this.textColor,
    required this.actionColor,
  });

  final String title;
  final String actionLabel;
  final Color textColor;
  final Color actionColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        const Spacer(),
        if (actionLabel.isNotEmpty)
          Text(
            actionLabel,
            style: TextStyle(
              color: actionColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
