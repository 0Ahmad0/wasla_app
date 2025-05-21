import 'package:get/get.dart';

import '../../home/model/product_model.dart';

class CheckOutController extends GetxController{
  List<ProductModel> allProducts = [
    ProductModel(
      id: 'p1',
      name: 'تيشيرت رجالي',
      imageUrl: 'https://picsum.photos/id/1005/200/200',
      price: 79.99,
    ),
    ProductModel(
      id: 'p2',
      name: 'جاكيت شتوي',
      imageUrl: 'https://picsum.photos/id/1012/200/200',
      price: 199.99,
    ),
    ProductModel(
      id: 'p3',
      name: 'فستان سهرة',
      imageUrl: 'https://picsum.photos/id/1018/200/200',
      price: 249.99,
    ),
  ];

}