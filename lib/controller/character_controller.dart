import 'package:flutter/material.dart';
import 'package:free_them_all/model/character.dart';
import 'package:free_them_all/utils/random.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../service/drawable.dart';

class CharacterController extends GetxController {
  late Character good;
  late Character bad;

  List<Image> goodSplited = <Image>[];

  @override
  Future<void> onInit() async {
    super.onInit();

    good = Character(id: generatedRandomId());
    await good.generateDrawable();
    goodSplited = await generateGoodSplited(good.svgRoot!);
  }
}
