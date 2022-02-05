import 'package:get/get.dart';

import 'character_controller.dart';

void setupController() {
  Get.put<CharacterController>(CharacterController(), permanent: true);
}
