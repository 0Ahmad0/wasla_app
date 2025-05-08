import 'package:wasla_app/app/features/home/model/product_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<ProductModel> products;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.products,
  });
}
