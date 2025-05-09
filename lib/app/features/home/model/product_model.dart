import 'package:get/get.dart';

class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final RxBool isFav;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    bool isFav = false,
  }) : isFav = isFav.obs;
}
