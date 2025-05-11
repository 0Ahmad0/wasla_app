import 'package:get/get.dart';
import 'package:wasla_app/app/features/menu/model/menu_item_model.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/dialogs/widgets/logout_dialog_widgets.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';

class MenuAppController extends GetxController {
  final List<MenuItemModel> bloc1Items = [
    MenuItemModel(
      title: StringsManager.personalInfoText,
      icon: AssetsManager.menuProfileIcon,
      route: AppRoutes.profile,
    ),
    MenuItemModel(
      title: StringsManager.couponText,
      icon: AssetsManager.menuCouponIcon,
      route: AppRoutes.coupons,
    ),
    MenuItemModel(
        title: StringsManager.addressText,
        icon: AssetsManager.menuMapIcon,
        route: AppRoutes.myAddress),
  ];
  final List<MenuItemModel> bloc2Items = [
    MenuItemModel(
        title: StringsManager.cartText, icon: AssetsManager.menuCartIcon),
    MenuItemModel(
      title: StringsManager.favoriteText,
      icon: AssetsManager.menuFavoriteIcon,
    ),
    MenuItemModel(
        title: StringsManager.notificationsText,
        icon: AssetsManager.menuNotificationIcon,
        route: AppRoutes.notification),
    MenuItemModel(
      title: StringsManager.paymentMethodsText,
      icon: AssetsManager.menuPayIcon,
    ),
  ];
  final List<MenuItemModel> bloc3Items = [
    MenuItemModel(
        title: StringsManager.customerSupportText,
        icon: AssetsManager.menuCustomerSupportIcon,
        route: AppRoutes.customerSupport),
    MenuItemModel(
        title: StringsManager.faqText,
        icon: AssetsManager.menuFaqsIcon,
        route: AppRoutes.faqs),
    MenuItemModel(
      title: StringsManager.userReviewsText,
      icon: AssetsManager.menuUserViewsIcon,
      route: AppRoutes.usersReviews,
    ),
    MenuItemModel(
      title: StringsManager.aboutAppText,
      icon: AssetsManager.aboutAppIcon,
      route: AppRoutes.about,
    ),
    MenuItemModel(
      title: StringsManager.settingsText,
      icon: AssetsManager.menuSettingIcon,
      route: AppRoutes.settings,
    ),
  ];
  final List<MenuItemModel> bloc4Items = [
    MenuItemModel(
      title: StringsManager.logoutText,
      icon: AssetsManager.menuLogoutIcon,
      route: null,
      onTap: (){
        AppDialog(
          widget: LogoutDialogWidget(),
        ).showAppDialog(Get.context!);
      }
    ),
  ];
}
