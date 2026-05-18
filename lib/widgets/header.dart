import 'package:flutter/material.dart';

import 'ghost_button.dart';
import 'navbar_item.dart';
import 'primary_button.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.isMobile, required this.textColor});

  final bool isMobile;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sacko Allou-Badra',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w800,
            fontSize: isMobile ? 18 : 22,
          ),
        ),
        const Spacer(),
        if (!isMobile) ...[
          NavbarItem(text: 'Courses', textColor: textColor),
          NavbarItem(text: 'Pricing', textColor: textColor),
          NavbarItem(text: 'Blog', textColor: textColor),
          NavbarItem(text: 'About Me', textColor: textColor),
          const SizedBox(width: 18),
          GhostButton(label: 'Log in', isMobile: isMobile),
          const SizedBox(width: 10),
        ],
        PrimaryButton(label: 'Sign up', isMobile: isMobile),
      ],
    );
  }
}
