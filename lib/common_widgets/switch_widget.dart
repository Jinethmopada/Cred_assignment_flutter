import 'package:cred_assignment/controller/category_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchWidget extends StatelessWidget {
   SwitchWidget({super.key});
   final CredController controller = Get.put(CredController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Obx(() {
        return Switch(
            value: controller.switchStatus.value,
            onChanged: (value) {
              controller.toggleSwitch();
            },
            activeColor: Colors.white,
            activeTrackColor:Colors.white38,
            inactiveTrackColor:Colors.black,
            inactiveThumbColor:Colors.white,
            autofocus: true,
        );
      }),
    );
  }
}
