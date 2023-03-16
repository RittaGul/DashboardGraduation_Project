import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashbord/controller/homePage_Controller.dart';
import 'package:dashbord/core/constant/SizeConfig.dart';
import 'package:dashbord/core/themes/Theme.dart';
import 'package:dashbord/views/widget/commandContainer.dart';
import 'package:dashbord/views/widget/statusContainer.dart';

class homePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(builder: ((controller) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Ecommece',
              style: Themes().headLine1,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ///////  لعرض اسم الايتم و العدد تبعه 
                    statusContainer(
                      statusName: 'Products',
                      statusOfNumber: '${controller.productCount}',
                    ),
                    SizedBox(
                      width: SizeConfig(context).widthScreen / 3.7,
                    ),
                    statusContainer(
                      statusName: 'Categories',
                      statusOfNumber: '5',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                /////////// عاملتلا وجد ل عناصر الصفحة
          
                commandContainer(
                  commandTitle: 'View all products',
                  commandImage: 'assets/images/product-29.svg',
                  colorImage: Colors.blue,
                  func: () async {
                    await controller.goToProductScreen();
                  },
                ),
                //////////////////
                ////////
                commandContainer(
                  commandTitle: 'Add New Product',
                  commandImage: 'assets/images/add_product.svg',
                  sizeImag: 50.0,
                  colorImage: Colors.green,
                  func: () {
                    controller.goToAddProductScreen();
                  },
                ),
                commandContainer(
                  commandTitle: 'Update Product',
                  commandImage: 'assets/images/update_product.svg',
                  sizeImag: 50.0,
                  colorImage: Colors.purple,
                  func: () {
                    controller.goToUpdateScreen();
                  },
                ),
                commandContainer(
                  commandTitle: 'Delete Product',
                  commandImage: 'assets/images/delete_product.svg',
                  sizeImag: 50.0,
                  colorImage: Colors.red,
                  func: () {
                    controller.goToDeleteProductScreen();
                  },
                )
              ],
            ),
          ));
    }));
  }
}
