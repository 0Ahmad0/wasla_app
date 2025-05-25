import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/my_orders/controllers/my_orders_controller.dart';
import 'package:wasla_app/app/features/my_orders/widgets/my_order_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../widgets/app_scaffold_widget.dart';
import '../widgets/filter_button_widget.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyOrdersController());
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: 70.h.height),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FilterButtonWidget(
                      onTap: () => controller.changeFilter(index),
                      currentIndex: controller.currentFilterIndex.value,
                      index: index,
                      list: controller.quotationsFilterList,
                      totalCount: controller.getCountByFilterIndex(index), // ✅ العدد الصحيح هنا
                    ),
                    separatorBuilder: (_, __) => 4.w.width,
                    itemCount: controller.quotationsFilterList.length,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                sliver: SliverList.separated(
                  separatorBuilder: (_, __) => 10.h.height,
                  itemBuilder: (context, index) {
                    final order = controller.filteredOrders[index];
                    return MyOrderWidget(order: order);
                  },
                  itemCount: controller.filteredOrders.length, // ✅ العدد الصحيح حسب الفلتر
                ),
              ),
            ],
          )),

          const AppBarWidget(title: StringsManager.myOrdersText)
        ],
      ),
    );
  }
}
