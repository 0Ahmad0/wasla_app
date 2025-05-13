import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/controllers/home_controller.dart';
import 'package:wasla_app/app/features/home/model/product_model.dart';

class FavoriteController extends GetxController {

  List<ProductModel> favoriteList = <ProductModel>[];

  void loadFavoriteList() {
    final productsController = Get.find<HomeController>();
    favoriteList = productsController.favoriteProducts;
  }

  @override
  void onInit() {
    loadFavoriteList();
    super.onInit();
  }
}
