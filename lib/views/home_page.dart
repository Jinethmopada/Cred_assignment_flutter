import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/category_page_controller.dart';

class HomePage extends StatelessWidget {

  final CredController controller = Get.put(CredController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child:Container()
            ),
           Obx(() => controller.imageValue.isEmpty ?
           Image.asset('assets/images/cred_img.png',width:140.0,) :
           Column(
             children: [
               Container(
                 margin:const EdgeInsets.only(left:10.0,bottom:70.0),
                   height:95.0,
                   width:95.0,
                   child: Image.network(controller.imageValue.toString())),
               Padding(
                 padding: const EdgeInsets.only(left:20.0,bottom:10.0),
                 child: Text("CRED ${controller.textValue.toString()}",style:const TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w700),),
               ),
               Padding(
                 padding: const EdgeInsets.only(left:20.0,bottom:10.0),
                 child: Text(controller.descriptionValue.toString(),style:const TextStyle(color:Colors.white70,fontSize:15,fontWeight:FontWeight.w700)),
               )
             ],
           ),
           ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                 style:const ButtonStyle(
                   backgroundColor:MaterialStatePropertyAll(Colors.white),
                 ),
                  onPressed: () {
                   Get.toNamed('/category');
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:78.0),
                        child: Text(
                          "Go to Category",
                          textAlign: TextAlign.center,
                          style:TextStyle(fontSize: 20,color:Colors.black),
                        ),
                      ),
                      Icon(Icons.arrow_right_alt,size:30.0,color:Colors.black,)
                    ],
                  )),
            )
          ],
        ));
  }
}
