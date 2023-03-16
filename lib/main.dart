import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashbord/controller/addnewproduct_Controller.dart';
import 'package:dashbord/controller/homePage_Controller.dart';
import 'package:dashbord/views/screens/addNewProductScreen.dart';
import 'package:dashbord/views/screens/allProductScreens.dart';
import 'package:dashbord/views/screens/homePageScreen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  HomePageControllerImp s1 = Get.put(HomePageControllerImp());
  AddNewProductControllerImp s2 = Get.put(AddNewProductControllerImp());
  initialData() async {
    await s1.getAllproduct();
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePageScreen(),
    );
  }
}
