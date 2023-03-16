import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductUpdateModel {
  String product_id;
  String update_type;
  String product_title;
  String product_supTitle;
  String product_price;
  ProductUpdateModel({
    required this.product_id,
    required this.update_type,
    required this.product_title,
    required this.product_supTitle,
    required this.product_price,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product_id': product_id,
      'update_type': update_type,
      'product_title': product_title,
      'product_supTitle': product_supTitle,
      'product_price': product_price,
    };
  }
}
