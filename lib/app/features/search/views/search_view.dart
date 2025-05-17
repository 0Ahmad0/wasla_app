import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/app_textfield_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/style_manager.dart';
import '../../home/widgtes/product_item_widget.dart';
import '../controllers/search_controller.dart';
import 'app_search_textfield.dart';

class SearchView extends GetView<SearchAppController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchAppController());

    return Scaffold(
      appBar: const AppBarWidget(title: 'ابحث عن منتجاتك'),
      body: Column(
        children: [
          AppPadding(
            vPadding: 10,
            hPadding: 12,
            child: AppSearchTextField(
              textInputAction: TextInputAction.search,
              controller: controller.searchController,
              hintText: 'ابحث هنا...',
              // onChanged: (value) =>
              //     controller.search(value, fromHistory: false, isSubmit: false),
              onFieldSubmitted: (value) =>
                  controller.search(value, fromHistory: false, isSubmit: true),
              suffixIcon: Obx(
                () => Visibility(
                  visible: controller.hasText.value,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => controller.clearSearch(),
                  ),
                ),
              ),
              prefixIcon: AppPadding(
                vPadding: 0,
                hPadding: 12,
                child: SvgPicture.asset(
                  AssetsManager.searchIcon,
                  colorFilter: const ColorFilter.mode(
                    ColorManager.notificationDateTimeGrayColor,
                    BlendMode.srcIn
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<SearchAppController>(
              builder: (_) {
                final isSearching = controller.isSearching;
                final results = controller.searchResults;
                final history = controller.searchHistory;
                final searchText = controller.searchController.text.trim();

                if (!isSearching && history.isNotEmpty && searchText.isEmpty) {
                  return ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      Text(
                        'نتائج البحث الأخيرة',
                        style: getBoldStyle(color: ColorManager.primaryColor),
                      ),
                      8.h.height,
                      ...history.map(
                        (query) => Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  controller.searchController.text = query;
                                  controller.search(query, fromHistory: true);
                                },
                                title: Text(
                                  query,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.history),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.deleteHistoryItem(query);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: const Icon(
                                  Icons.close,
                                  color: ColorManager.errorColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else if (isSearching && searchText.isNotEmpty) {
                  if (results.isEmpty) {
                    return const Center(
                        child: Text(
                      'لا يوجد نتائج للبحث ☹️',
                    ));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: results.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = results[index];
                      return ProductItemWidget(product: product);
                    },
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      20.h.height,
                      Transform.rotate(
                        angle: 4.4,
                        child: SvgPicture.asset(
                          width: 100.sp,
                          height: 250.sp,
                          AssetsManager.searchArrowIcon,
                          colorFilter: const ColorFilter.mode(
                            ColorManager.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      20.h.height,
                      Text(
                        'ابجث عن منتجاتك بسهولة😁',
                        style: getBoldStyle(
                            color: ColorManager.primaryColor, fontSize: 18),
                      ),
                    ],
                  ),
                ); // لا شيء افتراضيًا
              },
            ),
          ),
        ],
      ),
    );
  }
}
