import 'package:dashbord/core/constant/linkUri.dart';
import 'package:dashbord/core/functions/Crud.dart';
import 'package:dashbord/core/model/ProductUpdateModel.dart';

class ProductUpdateData {
  PostProductUpdateData(
      {required ProductUpdateModel productUpdateModel}) async {
    var res = await Crud().postData(
      updateProductUri,
      productUpdateModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
