import 'package:flutter/material.dart';
import 'package:free_them_all/model/character.dart';
import 'package:free_them_all/utils/random.dart';
import 'package:get/get.dart';

import '../service/drawable.dart';

class CharacterController extends GetxController {
  late Character victim;
  List<Image> goodSplited = <Image>[];

  @override
  Future<void> onInit() async {
    super.onInit();

    victim = Character(id: generatedRandomId());
    await victim.generateDrawable();

    final backgroundColor = Theme.of(Get.context!).colorScheme.secondary;

    goodSplited = await generateGoodSplited(victim.svgRoot!, backgroundColor);
  }
}
