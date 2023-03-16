import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashbord/core/constant/statusRequest.dart';
import 'package:dashbord/core/data/ProductUpdateData.dart';
import 'package:dashbord/core/data/deleteProductData.dart';
import 'package:dashbord/core/data/productsData.dart';
import 'package:dashbord/core/functions/handlingData.dart';
import 'package:dashbord/core/functions/snackBarMessage.dart';
import 'package:dashbord/core/model/ProductModel.dart';
import 'package:dashbord/core/model/ProductUpdateModel.dart';
import 'package:dashbord/views/screens/addNewProductScreen.dart';
import 'package:dashbord/views/screens/allProductScreens.dart';
import 'package:dashbord/views/screens/deleteProductScreen.dart';
import 'package:dashbord/views/screens/updateProductScreen.dart';

abstract class HomePageController extends GetxController {
  ////
  getAllproduct();
  /////////////لحتى يروح عالصفحات 
  goToProductScreen();
  goToAddProductScreen();
  goToDeleteProductScreen();
  goToUpdateScreen();
  //////////////////////
  deleteProduct({product_id, const_list_index});
  updateProduct({required product_id, required update_type});
}

class HomePageControllerImp extends HomePageController {

  ///////عرفت ليست فاضية لحى خزن جميع المنتجات 
  late List<ProductModel> allproduct = [];
  /*

   {
        "product_id": "2",
        "categories_id": "4",
        "product_image": "https://cdn.dsmcdn.com/ty562/product/media/images/20221013/11/192514310/19454673/1/1_org_zoom.jpg",
        "product_title": "FG FG sdf gdfs DFS DF DFS ",
        "product_supTitle": "asdasdsad asd",
        "product_stars": "3",
        "product_price": "453",
        "category_title": "Tshirt"
      },
      allproduct[0].product_image

 */

  late StatusRequest statusRequest;
  var productCount;
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController price;
  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    allproduct = [];
    productCount = '0';
    title = TextEditingController();
    description = TextEditingController();
    price = TextEditingController();
    super.onInit();
  }

  @override 
  getAllproduct() async {
    
  allproduct = [];
    update();
    statusRequest = StatusRequest.loading;
    update();
    var res = await productData().PostproductData(); ///// تخزين جميع البيانات بقلب الريس 
    statusRequest = handlingData(res);
    if (statusRequest == StatusRequest.success) {
      if (allproduct.isEmpty) {
        ////فور لحتى تاخد البيانات من الريس الى الل برودكت
        for (var item in res['1']['INFO']) {
          allproduct.add(ProductModel.fromJson(item));
        }
        productCount = res['2'][0]['product_count'];
        update();
  
      }
    }
    
  }

  @override
  goToProductScreen() async {
    await getAllproduct();
    Get.to(() => allProductScreen());
  }

  @override
  goToAddProductScreen() {
    Get.to(() => addNewProductScreen());
  }

  @override
  goToUpdateScreen() {
    Get.to(() => updateProductScreen());
  }

  @override
  deleteProduct({product_id, const_list_index}) async {
    allproduct.removeAt(const_list_index);
    update();
    Future.delayed(Duration.zero, () async {
      var res = await DeleteProductData()
          .PostdeleteProductData(product_id: '$product_id');
      statusRequest = handlingData(res);
      if (statusRequest == StatusRequest.success) {
        print('deleted');
        sncakBarMessage(
          title: 'successfully',
          message: 'Deleted successfully',
          backgroundColor: Colors.green,
        );
        await getAllproduct();
      } else {
        sncakBarMessage(
          title: 'Error',
          message: 'Please try again later',
          backgroundColor: Colors.green,
        );
        print('errpr');
      }
    });
  }

  @override
  goToDeleteProductScreen() {
    Get.to(() => deleteProductScreen());
  }

  @override
  updateProduct({required product_id, required update_type}) async {
    var res = await ProductUpdateData().PostProductUpdateData(
      productUpdateModel: ProductUpdateModel(
        product_id: product_id, 
        update_type: update_type,
        product_title: description.text,
        product_supTitle: title.text,
        product_price: price.text,
      ),
    );
    statusRequest = handlingData(res);
    print('$res');
    if (statusRequest == StatusRequest.success) {
      await getAllproduct();
      sncakBarMessage(
        title: 'successfully',
        message: 'Updated successfully',
        backgroundColor: Colors.green,
      );
    } else {
      sncakBarMessage(
        title: 'Error',
        message: 'Updated Faild',
        backgroundColor: Colors.red,
      );
    }
  }
}
