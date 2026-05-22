import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({
    super.key,
    required this.isFirstModel,
    required this.body,
  });
  final bool isFirstModel;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          isFirstModel
              ? Positioned(
                top: -120,
                right: -100,
                child: Container(
                  width: 520,
                  height: 520,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(260),
                  ),
                ),
              )
              : Positioned(
                top: -100,
                left: -120,
                child: Container(
                  width: 480,
                  height: 480,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(260),
                  ),
                ),
              ),
          isFirstModel
              ? Positioned(
                bottom: -100,
                left: -80,
                child: Container(
                  width: 380,
                  height: 380,
                  decoration: BoxDecoration(
                    color: AppColors.inversePrimary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(190),
                  ),
                ),
              )
              : Positioned(
                bottom: -120,
                right: -80,
                child: Container(
                  width: 420,
                  height: 420,
                  decoration: BoxDecoration(
                    color: AppColors.inversePrimary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(210),
                  ),
                ),
              ),
          SingleChildScrollView(child: SafeArea(child: body)),
        ],
      ),
    );
  }
}
