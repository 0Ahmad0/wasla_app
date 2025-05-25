import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/favorite/controllers/favorite_controller.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../widgets/app_scaffold_widget.dart';
import '../../home/widgtes/product_item_widget.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBarWidget(
        title: StringsManager.favoriteText,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.favoriteList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = controller.favoriteList[index];
          return ProductItemWidget(product: product);
        },
      ),
    );
  }
}
