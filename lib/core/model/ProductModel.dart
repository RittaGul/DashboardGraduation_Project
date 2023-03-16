import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  ////////////////// المعلومات  اللي ح جيبا من الداتا الخاصة بكل منتج
  var product_id;
  var categories_id;
  var product_price;
  String product_image;
  String product_title;
  String product_supTitle;
  String category_title;
  var product_stars;
  ProductModel({
    required this.product_id,
    required this.categories_id,
    required this.product_price,
    required this.product_image,
    required this.product_title,
    required this.product_supTitle,
    required this.product_stars,
    required this.category_title,
  });

  factory ProductModel.fromJson(map) {
    return ProductModel(
        product_id: map['product_id'],
        categories_id: map['categories_id'] ,
        product_price: map['product_price'] ,
        product_image: map['product_image'] as String,
        product_title: map['product_title'] as String,
        product_supTitle: map['product_supTitle'] as String,
        product_stars: map['product_stars'] ,
        category_title: map['category_title'] as String);
  }
}


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

 */