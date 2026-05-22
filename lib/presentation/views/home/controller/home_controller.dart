import 'package:get/get.dart';

class HomeController extends GetxController {
  final isHovered = false.obs;
  final scale = 1.0.obs;
  final width = 0.0.obs;
  final isMobile = false.obs;

  void onHover(bool hover) {
    isHovered.value = hover;
  }

  void scaleOnHover(bool hover) {
    scale.value = hover ? 1.06 : 1.0;
  }
}
