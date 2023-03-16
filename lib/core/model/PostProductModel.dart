import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostProductModel {
  String categories_id;
  String product_image;
  String product_title;
  String product_supTitle;
  String product_stars;
  String product_price;
  PostProductModel({
    required this.categories_id,
    required this.product_image,
    required this.product_title,
    required this.product_supTitle,
    required this.product_stars,
    required this.product_price,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'categories_id': categories_id,
      'product_image': product_image,
      'product_title': product_title,
      'product_supTitle': product_supTitle,
      'product_stars': product_stars,
      'product_price': product_price,
    };
  }
}
