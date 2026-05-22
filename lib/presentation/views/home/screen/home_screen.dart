import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../widgets/footer.dart';
import '../controller/home_controller.dart';
import '../widgets/hero_section.dart';
import 'wrapper_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.width.value = MediaQuery.sizeOf(context).width;
    controller.isMobile.value = controller.width.value < 900;
    return WrapperScreen(
      isFirstModel: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroSection(
            isMobile: controller.isMobile.value,
            textColor: AppColors.onSurface,
            mutedTextColor: AppColors.onSurfaceVariant,
          ),
          const SizedBox(height: 40),
          Footer(
          ),
        ],
      ),
    );
  }
}
