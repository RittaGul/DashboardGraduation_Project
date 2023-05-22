import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dashbord/controller/homePage_Controller.dart';
import 'package:dashbord/core/functions/DialogItems.dart';
import 'package:dashbord/core/functions/getnetworkImage.dart';
import 'package:dashbord/core/themes/Theme.dart';
import 'package:dashbord/views/widget/inputFaild.dart';
import 'package:dashbord/views/widget/myButton.dart';

class productContainer extends GetView<HomePageControllerImp> {
  int product_id;
  var screenType;

  productContainer({
    required this.product_id,
    this.screenType,
  });
  @override
  Widget build(BuildContext context) {
    return Card(

      
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Row(
              // mainAxisAlignment: ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetnetworkImage(
                  imageUri:
                      '${controller.allproduct[product_id].product_image}',
                ),
                Container(
                  width: 230,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ////////
                      //هي لحتى اذا الوصف اكتر من 20 حرف يحط نقااااااااااط

                      Text(
                        controller.allproduct[product_id].product_supTitle
                                    .length >
                                20
                            ? '${controller.allproduct[product_id].product_supTitle.substring(0, 20)} ... '
                            : '${controller.allproduct[product_id].product_supTitle}',
                        style: Themes().headLine1.copyWith(
                              fontSize: 17,
                            ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        controller.allproduct[product_id].product_title.length >
                                35
                            ? '${controller.allproduct[product_id].product_title.substring(0, 34)} ...'
                            : '${controller.allproduct[product_id].product_title} ...',
                        style: Themes().headLine1.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[800],
                            ),
                      ),
                      Text(
                        '${controller.allproduct[product_id].category_title}',
                        style: Themes().headLine1.copyWith(
                              fontSize: 17,
                            ),
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(5, (index) {
                            return Icon(
                              index <
                                      int.parse(controller
                                          .allproduct[product_id].product_stars)
                                  ? Icons.star_sharp
                                  : Icons.star_outline_sharp,
                              color: index <
                                      int.parse(controller
                                          .allproduct[product_id].product_stars)
                                  ? Colors.orange
                                  : Colors.black,
                            );
                          })),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (screenType == 2)
                  Transform.translate(
                    offset: Offset(15, 20),
                    child: PopupMenuButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onSelected: (item) => onSelected(context, item as int),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text("Edit title"),
                          value: 0,
                        ),
                        const PopupMenuItem(
                          child: Text("Edit description"),
                          value: 1,
                        ),
                        const PopupMenuItem(
                          child: Text("Edit price"),
                          value: 2,
                        )
                      ],
                    ),
                  ),
                if (screenType == 1)
                  Transform.translate(
                    offset: Offset(15, 20),
                    child: IconButton(
                      onPressed: () {
                        DialogItems(
                          fontSize: 15.3,
                          context: context,
                          title: 'Are you sure to delete the product ?!!',
                          content: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyButton(
                                    func: () {
                                      controller.deleteProduct(
                                        const_list_index: product_id,
                                        product_id:
                                            '${controller.allproduct[product_id].product_id}',
                                      );
                                      Get.back();
                                    },
                                    title: 'Yes'),
                                MyButton(
                                    func: () {
                                      Get.back();
                                    },
                                    title: 'No'),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 40,
                ),
                //////////////////
                ///
                ///
                ///
                ///
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '${controller.allproduct[product_id].product_price} TL',
                    style: Themes().headLine1.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) async {
    switch (item) {
      case 0:
        updateUserInf(
            context: context,
            title: 'Title',
            hintTitle: 'Enter title here . ',
            controller: controller.title,
            func: () async {
              await controller.updateProduct(
                product_id: '${controller.allproduct[product_id].product_id}',
                update_type: '0',
              );
              Get.back();
            });
        break;
      case 1:
        updateUserInf(
            context: context,
            title: 'Description',
            hintTitle: 'Enter description here . ',
            controller: controller.description,
            func: () async {
              await controller.updateProduct(
                product_id: '${controller.allproduct[product_id].product_id}',
                update_type: '1',
              );
              Get.back();
            });
        break;
      case 2:
        updateUserInf(
            context: context,
            title: 'Price',
            hintTitle: 'Enter price here . ',
            controller: controller.price,
            keyboardType: TextInputType.number,
            func: () async {
              await controller.updateProduct(
                product_id: '${controller.allproduct[product_id].product_id}',
                update_type: '2',
              );
              Get.back();
            });
        break;
    }
  }

  Future updateUserInf(
      {required BuildContext context,
      required String title,
      required String hintTitle,
      required TextEditingController controller,
      var func,
      var maxChar,
      var keyboardType}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: inputFaild(
          keyboardType: keyboardType ?? TextInputType.text,
          title: '$title',
          hintText: '$hintTitle',
          textEditingController: controller,
        ),
        actions: [
          SizedBox(
            width: 20,
          ),
          MyButton(
            func: func,
            title: 'Submit',
          ),
          SizedBox(
            width: 50,
          ),
          MyButton(
            func: () {
              Get.back();
            },
            title: 'Close',
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
