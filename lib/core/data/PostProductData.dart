import 'package:dashbord/core/constant/linkUri.dart';
import 'package:dashbord/core/functions/Crud.dart';
import 'package:dashbord/core/model/PostProductModel.dart';

class PostProduct {
  PostproductData({required PostProductModel postProductModel}) async {
    var res = await Crud().postData(
      addnewproductUri,
      postProductModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
