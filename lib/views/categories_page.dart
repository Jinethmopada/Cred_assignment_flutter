import 'package:cred_assignment/common_widgets/switch_widget.dart';
import 'package:cred_assignment/controller/category_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/items_view_widget.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  final CredController controller = Get.put(CredController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 55.0, left: 15.0, bottom: 20.0),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("explore",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 25,
                              fontWeight: FontWeight.w700))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "CRED",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.start,
                          )),
                      const SizedBox(width:70.0,),
                      SwitchWidget(),
                      InkWell(
                        child: Container(
                            height: 20.0,
                            width: 20.0,
                            margin: const EdgeInsets.only(right: 20.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Obx(() => controller.isWidgetsVisible.value
                                ? const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 18.0,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_up_outlined,
                                    size: 18.0,
                                    color: Colors.white,
                                  ))),
                        onTap: () {
                          controller.toggleWidgetsVisibility();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            ItemsViewWidget()
          ],
        ),
      ),
    );
  }
}
