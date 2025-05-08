import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/home/widgtes/carousel_home_item_widget.dart';
import 'package:wasla_app/app/features/home/widgtes/category_item_widget.dart';
import 'package:wasla_app/app/features/home/widgtes/custom_home_appbar.dart';
import 'package:wasla_app/app/features/home/widgtes/product_item_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child:
            const Icon(Icons.add_shopping_cart, color: ColorManager.whiteColor),
      ),
      appBar: CustomHomeAppbar(
        height: 150,
        childW: AppPadding(
          vPadding: 0,
          hPadding: 16,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.h.height,
                      Text(
                        StringsManager.welcomeText,
                        style: getMediumStyle(
                            color: ColorManager.whiteColor, fontSize: 16),
                      ),
                      4.h.height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 1.5,
                        child: Text(
                          'أحمد الحريري 😎',
                          maxLines: 1,
                          style: getBoldStyle(
                              fontSize: 22, color: ColorManager.whiteColor),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26.sp,
                        backgroundImage: AssetImage(
                          'assets/images/img.png',
                        ),
                      ),
                      10.w.width,
                      Icon(
                        Icons.notifications,
                        color: ColorManager.whiteColor,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                8.h.height,
                CarouselSlider.builder(
                  itemCount: controller.carouselHomeItems.length,
                  itemBuilder: (context, index, _) {
                    final item = controller.carouselHomeItems[index];
                    return CarouselHomeItemWidget(
                      imageURL: item.image,
                      text: item.text,
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      controller.onPageChanged(index);
                    },
                    aspectRatio: 2.4,
                    autoPlay: true,
                    viewportFraction: 0.75,
                    enlargeCenterPage: true,
                    enlargeFactor: .225,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                ),
                4.h.height,
                Obx(
                  () => AnimatedSmoothIndicator(
                    activeIndex: controller.activeIndex.value,
                    count: controller.carouselHomeItems.length,
                    effect: SwapEffect(
                      paintStyle: PaintingStyle.fill,
                      type: SwapType.yRotation,
                      // type: WormType.thin,
                      activeDotColor: ColorManager.primaryColor,
                      dotColor: ColorManager.notificationDateTimeGrayColor,
                      dotWidth: 10.sp,
                      dotHeight: 10.sp,
                    ),
                  ),
                ),
                4.h.height,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 54.h,
              // color: ColorManager.errorColor,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  print(controller.categoriesList);
                  final category = controller.categoriesList[index];
                  return CategoryItemWidget(
                    imageURL: category.imageUrl,
                    name: category.name,
                    index: index,
                  );
                },
                separatorBuilder: (_, __) => 20.w.width,
                itemCount: controller.categoriesList.length,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            sliver: Obx(()=>SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,mainAxisSpacing: 8.h,
                  childAspectRatio: .85
              ),
              itemBuilder: (context, index) {
                final product = controller
                    .categoriesList[controller.activeCategoryIndex.value]
                    .products[index];
                return ProductItemWidget(
                  product: product,
                );
              },
              itemCount: controller
                  .categoriesList[controller.activeCategoryIndex.value]
                  .products
                  .length,
            )),
          )
        ],
      ),
    );
  }
}
