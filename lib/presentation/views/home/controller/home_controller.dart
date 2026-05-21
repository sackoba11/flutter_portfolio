import 'package:get/get.dart';

class HommeController extends GetxController {
  final isHovered = false.obs;
  final scale = 1.0.obs;

  void onHover(bool hover) {
    isHovered.value = hover;
  }

  void scaleOnHover(bool hover) {
    scale.value = hover ? 1.06 : 1.0;
  }
}
