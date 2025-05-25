import 'package:get/get.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../../core/assets_manager.dart';
import '../enum/orser_status.dart';
import '../model/filter_model.dart';
import '../model/order_model.dart';

class MyOrdersController extends GetxController {
  final  List<FilterModel> quotationsFilterList = [
    FilterModel(
      name: StringsManager.allText,
    ),
    FilterModel(
      name: StringsManager.acceptedText,
      icon: AssetsManager.checkCircleIcon,
    ),
    FilterModel(
      name: StringsManager.pendingText,
      icon: AssetsManager.waitingIcon,
    ),
    FilterModel(
      name: StringsManager.rejectedText,
      icon: AssetsManager.rejectedCircleIcon,
    ),
  ];

  RxInt currentFilterIndex = 0.obs;

  final RxList<OrderModel> allOrders = <OrderModel>[
    OrderModel(id: 'QQ1122Z', price: 850, status: OrderStatus.accepted),
    OrderModel(id: 'AF1250H', price: 1000, status: OrderStatus.rejected),
    OrderModel(id: 'XY4231J', price: 750, status: OrderStatus.accepted),
    OrderModel(id: 'GH7723L', price: 500, status: OrderStatus.pending),
    OrderModel(id: 'XY4231J', price: 750, status: OrderStatus.accepted),
    OrderModel(id: 'XY4231J', price: 750, status: OrderStatus.accepted),
    OrderModel(id: 'AF1250H', price: 1000, status: OrderStatus.rejected),
    OrderModel(id: 'GH7723L', price: 500, status: OrderStatus.pending),
    OrderModel(id: 'QQ1122Z', price: 850, status: OrderStatus.accepted),
    OrderModel(id: 'QQ1122Z', price: 850, status: OrderStatus.accepted),
    OrderModel(id: 'GH7723L', price: 500, status: OrderStatus.pending),
    OrderModel(id: 'AF1250H', price: 1000, status: OrderStatus.rejected),
  ].obs;

  List<OrderModel> get filteredOrders {
    switch (currentFilterIndex.value) {
      case 1:
        return allOrders.where((e) => e.status == OrderStatus.accepted).toList();
      case 2:
        return allOrders.where((e) => e.status == OrderStatus.pending).toList();
      case 3:
        return allOrders.where((e) => e.status == OrderStatus.rejected).toList();
      default:
        return allOrders;
    }
  }

  int getCountByFilterIndex(int index) {
    switch (index) {
      case 1:
        return allOrders.where((e) => e.status == OrderStatus.accepted).length;
      case 2:
        return allOrders.where((e) => e.status == OrderStatus.pending).length;
      case 3:
        return allOrders.where((e) => e.status == OrderStatus.rejected).length;
      default:
        return allOrders.length;
    }
  }


  void changeFilter(int index) {
    currentFilterIndex.value = index;
  }
}
