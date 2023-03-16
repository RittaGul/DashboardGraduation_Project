import 'package:dashbord/core/constant/linkUri.dart';
import 'package:dashbord/core/functions/Crud.dart';
import 'package:dashbord/core/model/PostProductModel.dart';

class DeleteProductData {
  PostdeleteProductData({required product_id}) async {
    var res = await Crud().postData(
      deleteProductsUri,
      {
        'product_id': '$product_id',
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
