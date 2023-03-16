import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dashbord/controller/homePage_Controller.dart';
import 'package:dashbord/core/constant/SizeConfig.dart';
import 'package:dashbord/core/functions/getnetworkImage.dart';
import 'package:dashbord/core/themes/Theme.dart';
import 'package:dashbord/views/widget/productContainer.dart';
import 'package:lottie/lottie.dart';

class deleteProductScreen extends StatefulWidget {
  @override
  State<deleteProductScreen> createState() => _deleteProductScreenState();
}

class _deleteProductScreenState extends State<deleteProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'All Products',
            style: Themes().headLine1,
          ),
        ),
        body: SizedBox(
          width: 500,
          height: 1000,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: controller.allproduct.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: productContainer(
                  screenType: 1,
                  product_id: index,
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
