import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../home/controller/home_controller.dart';

class GhostButton extends GetView<HomeController> {
  const GhostButton({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedScale(
        scale: controller.scale.value,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: TextButton(
          onPressed: onTap,
          onHover: (hover) {
            controller.onHover(hover);
            controller.scaleOnHover(hover);
          },
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(
              AppColors.primaryContainer.withOpacity(0.5),
            ),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 42, vertical: 16),
            ),
            mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
            backgroundColor: WidgetStatePropertyAll(AppColors.primary),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.onPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      );
    });
  }
}
