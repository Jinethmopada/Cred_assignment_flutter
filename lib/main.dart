import 'package:cred_assignment/views/categories_page.dart';
import 'package:cred_assignment/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cred App',
      initialRoute: '/home',
      getPages: [
        GetPage(name:'/home', page:()=> HomePage(),transition: Transition.downToUp),
        GetPage(name: '/category', page:()=>  CategoriesPage(),transition:Transition.circularReveal,transitionDuration:const Duration(seconds:2))
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

