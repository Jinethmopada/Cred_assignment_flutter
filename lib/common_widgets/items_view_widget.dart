import 'package:cred_assignment/controller/category_page_controller.dart';
import 'package:cred_assignment/model/category_model.dart';
import 'package:cred_assignment/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsViewWidget extends StatelessWidget {
  ItemsViewWidget({super.key});
  final CredController controller = Get.put(CredController());

  @override
  Widget build(BuildContext context) {
    return
      Obx(() => (
          controller.isWidgetsVisible.value ? Obx(() => controller.switchStatus.value ?
          Column(
            children:List.generate(CategoryItems().data.length, (index) {
              final section = CategoryItems().data[index];
              final sectionTitle = section['section_properties']['title'];
              final items = section['section_properties']['items'];
              return Column(
                children: [
                  Align(alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top:15.0,left: 30.0,bottom: 20.0),
                        child: Text(sectionTitle,style:const TextStyle(color:Colors.white54,fontSize:25,fontWeight:FontWeight.w700),),
                      )),
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index]['display_data'];
                          final itemName = item['name'];
                          final itemIconUrl = item['icon_url'];
                          final itemDescription = item['description'];
                          return Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                    height:85.0,
                                    width: 85.0,
                                    margin:const EdgeInsets.only(left:30.0,right:20.0,bottom:15.0),
                                    decoration:BoxDecoration(
                                        border:Border.all(color:Colors.white12)
                                    ),
                                    child:Image.network(itemIconUrl,width:10.0,)
                                ),
                                onTap:(){
                                  controller.onAddImagesAndText(itemIconUrl,itemName, itemDescription);
                                  Get.to(HomePage());
                                },
                              ),
                              Column(
                                children: [
                                  Text(itemName,style:const TextStyle(color:Colors.white,fontSize:15.0,fontWeight:FontWeight.w700),),
                                  Text(itemDescription,style:const TextStyle(color:Colors.white38,fontSize:10.0,fontWeight:FontWeight.w700,overflow:TextOverflow.clip)),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  )
                ],
              );
            }),
          )
              :ListView.builder(
              shrinkWrap: true,
              itemCount:CategoryItems().data.length,
              itemBuilder:(BuildContext context,int index){
                final section = CategoryItems().data[index];
                final sectionTitle = section['section_properties']['title'];
                final items = section['section_properties']['items'];
                return Column(
                  children: [
                    Align(alignment:Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0,left: 30.0,bottom: 20.0),
                          child: Text(sectionTitle,style:const TextStyle(color:Colors.white54,fontSize:25,fontWeight:FontWeight.w700),),
                        )),
                    Container(
                      margin:const EdgeInsets.only(bottom: 20.0),
                      height: 120,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index]['display_data'];
                          final itemName = item['name'];
                          final itemIconUrl = item['icon_url'];
                          final itemDescription = item['description'];
                          return Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                    height:85.0,
                                    width: 85.0,
                                    margin:const EdgeInsets.only(left:30.0,right:20.0),
                                    decoration:BoxDecoration(
                                        border:Border.all(color:Colors.white12)
                                    ),
                                    child:Image.network(itemIconUrl,width:10.0,)
                                ),
                                onTap: (){
                                  controller.onAddImagesAndText(itemIconUrl,itemName, itemDescription);
                                  Get.to(HomePage());
                                },
                              ),
                              Text(itemName,style:const TextStyle(color:Colors.white,fontSize:15.0,fontWeight:FontWeight.w700),),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              })
          ): Container())
      );
  }
}
