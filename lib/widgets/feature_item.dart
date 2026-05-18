import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.check, size: 16),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
