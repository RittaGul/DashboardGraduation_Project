import 'package:dashbord/controller/homePage_Controller.dart';
import 'package:dashbord/core/constant/statusRequest.dart';
import 'package:dashbord/core/data/PostProductData.dart';
import 'package:dashbord/core/functions/DialogItems.dart';
import 'package:dashbord/core/functions/getnetworkImage.dart';
import 'package:dashbord/core/functions/handlingData.dart';
import 'package:dashbord/core/functions/snackBarMessage.dart';
import 'package:dashbord/core/model/PostProductModel.dart';
import 'package:dashbord/core/themes/Theme.dart';
import 'package:dashbord/views/screens/homePageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

HomePageControllerImp homePageControllerImp = Get.find();

abstract class AddNewProductController extends GetxController {
  postData();
  testImage({required BuildContext context});
}

class AddNewProductControllerImp extends AddNewProductController {
  late bool resultTestImage;
  late StatusRequest statusRequest;
  late TextEditingController imageUri;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController price;
  late int categoryIndex;
  late int starIndex;
  @override
  void onInit() {
    resultTestImage = false;
    imageUri = TextEditingController();
    title = TextEditingController();
    description = TextEditingController();
    price = TextEditingController();
    categoryIndex = 1;
    starIndex = 1;
    statusRequest = StatusRequest.none;
    super.onInit();
  }

  clear() {
    title.clear();
    imageUri.clear();
    description.clear();
    price.clear();
    categoryIndex = 1;
    starIndex = 1;
  }

  getData() {
    print('============${imageUri.text}');
    print('============${title.text}');
    print('============${description.text}');
    print('============${price.text}');
    print('============${categoryIndex}');
    print('============${starIndex}');
  }

  @override
  postData() async {
    if (imageUri.text.isEmpty ||
        title.text.isEmpty ||
        description.text.isEmpty ||
        price.text.isEmpty) {
      sncakBarMessage(title: 'wrong entry', message: 'Please Try Again');
    } else {
      if (resultTestImage) {
        print('object');

        statusRequest = StatusRequest.loading;
        update();
        Future.delayed(Duration(seconds: 2), () async {
          var res = await PostProduct().PostproductData(
            postProductModel: PostProductModel(
              categories_id: '$categoryIndex',
              product_image: imageUri.text,
              product_title: description.text,
              product_supTitle: title.text,
              product_stars: '$starIndex',
              product_price: price.text,
            ),
          );
          getData();
          print('$res');
          statusRequest = handlingData(res);
          if (statusRequest == StatusRequest.success) {
            await homePageControllerImp.getAllproduct();
            sncakBarMessage(
              title: 'successfully',
              message: 'Added successfully',
              backgroundColor: Colors.green,
            );
            statusRequest = StatusRequest.none;
            update();
            Get.offAll(() => homePageScreen());
            clear();
            update();
          } else {
            statusRequest = StatusRequest.none;
            update();
            sncakBarMessage(
              title: 'Error',
              message: 'Please Try Again Later',
              backgroundColor: Colors.green,
            );
          }
        });
      } else {
        sncakBarMessage(
            title: 'wrong entry',
            message: 'The image has not been tested properly');
      }
    }
  }

  @override
  testImage({required BuildContext context}) async {
    try {
      var res = await http.get(Uri.parse(imageUri.text));
      if (res.statusCode == 200) {
        if (Uri.parse('${imageUri.text}').isAbsolute) {
          resultTestImage = true;
          update();
          print('trueee');
          return DialogItems(
            context: context,
            title: 'Test Uri',
            content: Container(
              height: 320,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetnetworkImage(
                    imageUri: '${Uri.parse(imageUri.text)}',
                    imageSize: 300.0,
                  )
                ],
              ),
            ),
          );
        }
      }
    } catch (_) {
      return DialogItems(
        context: context,
        title: 'Test Uri',
        content: Container(
          height: 320,
          width: 400,
          child: Column(
            children: [
              Lottie.asset(
                'assets/lottie/offline.json',
                width: 200,
                height: 200,
              ),
              Text(
                'Wrong Entry, Please Try Again',
                style: Themes().headLine1.copyWith(
                      fontSize: 17,
                    ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
