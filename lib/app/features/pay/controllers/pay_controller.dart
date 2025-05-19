import 'package:get/get.dart';
import 'package:wasla_app/core/assets_manager.dart';

import '../model/payment_method_model.dart';

class PayController extends GetxController {
  RxInt selectedMethodIndex = 0.obs;

  final List<PaymentMethodModel> paymentMethods = [
    PaymentMethodModel(
      title: 'Mastercard 9833',
      subtitle: '734, Exp: 12/29',
      icon: AssetsManager.masterCardIcon,
    ),
    PaymentMethodModel(
      title: 'Visa 7233',
      subtitle: '321, Exp: 11/29',
      icon: AssetsManager.visaIcon,
    ),
    PaymentMethodModel(
      title: 'سيرياتيل كاش',
      icon: AssetsManager.syriatelCashIcon,
    ),
    PaymentMethodModel(
      title: 'بنك البركة',
      icon: AssetsManager.barakeIcon,
    ),
  ];

  void selectMethod(int index) {
    selectedMethodIndex.value = index;
  }
}
