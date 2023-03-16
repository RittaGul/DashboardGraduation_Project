import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dashbord/controller/addnewproduct_Controller.dart';
import 'package:dashbord/core/constant/statusRequest.dart';
import 'package:dashbord/core/functions/DialogItems.dart';
import 'package:dashbord/core/functions/DropDownMenu.dart';
import 'package:dashbord/core/functions/getnetworkImage.dart';
import 'package:dashbord/core/themes/Theme.dart';
import 'package:dashbord/views/widget/inputFaild.dart';
import 'package:dashbord/views/widget/myButton.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class addNewProductScreen extends StatefulWidget {
  @override
  State<addNewProductScreen> createState() => _addNewProductScreenState();
}

class _addNewProductScreenState extends State<addNewProductScreen> {
  TextEditingController controller = TextEditingController();
  var selectCategory = [
    'Mobile',
    'Laptob',
    'Pants',
    'Tshirt',
    'Else',
  ];
  var starList = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  var SelectItem;
  var SelectStar;
  @override
  void initState() {
    SelectItem = selectCategory[0];
    SelectStar = starList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewProductControllerImp>(builder: ((controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Add New Product',
            style: Themes().headLine1,
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: controller.statusRequest == StatusRequest.loading
                  ? true
                  : false,
              child: Lottie.asset(
                'assets/lottie/loading.json',
                width: 350,
                height: 350,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: controller.statusRequest == StatusRequest.none ? 1 : .4,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: inputFaild(
                              textEditingController: controller.imageUri,
                              title: 'Image Uri',
                              hintText: 'Enter image uri here . ',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Transform.translate(
                            offset: Offset(0, 17),
                            child: MyButton(
                              func: () async {
                                await controller.testImage(context: context);
                              },
                              title: 'Test',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputFaild(
                        textEditingController: controller.title,
                        title: 'Title',
                        hintText: 'Enter title here . ',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputFaild(
                        textEditingController: controller.description,
                        title: 'Description',
                        hintText: 'Enter description here . ',
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputFaild(
                        textEditingController: controller.price,
                        title: 'Price',
                        hintText: 'Enter description here . ',
                        keyboardType: TextInputType.number,
                        // maxLines: 3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category',
                              style: Themes().headLine1,
                            ),
                            Text(
                              'Stars',
                              style: Themes().headLine1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: DropDownMenu(
                            ListInfo: selectCategory,
                            selectedInfo: SelectItem,
                            func: (val) {
                              setState(() {});
                              SelectItem = val as String;
                              controller.categoryIndex =
                                  selectCategory.indexOf(val) + 1;
                              // print('${selectCategory.indexOf(val) + 1}');
                            },
                          )),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: DropDownMenu(
                            ListInfo: starList,
                            selectedInfo: SelectStar,
                            func: (val) {
                              setState(() {});
                              SelectStar = val as String;
                              controller.starIndex = starList.indexOf(val) + 1;
                              // print('${starList.indexOf(val) + 1}');
                            },
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          width: 250,
                          height: 50,
                          child: MyButton(
                            func: () {
                              controller.postData();
                            },
                            title: 'Continue',
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
