import 'package:dashbord/core/constant/linkUri.dart';
import 'package:dashbord/core/functions/Crud.dart';

class productData {
  PostproductData() async {
    ///// لجلب البيانات من الرابط اللي ضفته  ع ملف اللينك 
    var res = await Crud().postData(
      getAllProductsUri,
      {},
    );
    return res.fold((l) => l, (r) => r);
  }
}
