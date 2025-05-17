import 'package:get/get.dart';
import 'package:wasla_app/app/features/about/views/about_view.dart';
import 'package:wasla_app/app/features/auth/bindings/auth_binding.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/auth/views/login_view.dart';
import 'package:wasla_app/app/features/auth/views/otp_view.dart';
import 'package:wasla_app/app/features/auth/views/reset_password_view.dart';
import 'package:wasla_app/app/features/auth/views/signup_view.dart';
import 'package:wasla_app/app/features/cart/bindings/cart_binding.dart';
import 'package:wasla_app/app/features/cart/views/cart_view.dart';
import 'package:wasla_app/app/features/coupons/bindings/coupons_binding.dart';
import 'package:wasla_app/app/features/coupons/views/coupons_view.dart';
import 'package:wasla_app/app/features/customer_support/bindings/customer_support_binding.dart';
import 'package:wasla_app/app/features/customer_support/bindings/media_viewer_binding.dart';
import 'package:wasla_app/app/features/customer_support/views/customer_support_view.dart';
import 'package:wasla_app/app/features/customer_support/views/media_viewer_view.dart';
import 'package:wasla_app/app/features/faqs/bindings/faqs_binding.dart';
import 'package:wasla_app/app/features/faqs/views/faqs_view.dart';
import 'package:wasla_app/app/features/favorite/bindings/favorite_binding.dart';
import 'package:wasla_app/app/features/favorite/views/favorite_view.dart';
import 'package:wasla_app/app/features/home/bindings/home_binding.dart';
import 'package:wasla_app/app/features/home/views/home_view.dart';
import 'package:wasla_app/app/features/menu/bindings/menu_binding.dart';
import 'package:wasla_app/app/features/menu/views/menu_view.dart';
import 'package:wasla_app/app/features/my_address/bindings/my_address_binding.dart';
import 'package:wasla_app/app/features/my_address/views/my_address_view.dart';
import 'package:wasla_app/app/features/navbar/bindings/navbar_binding.dart';
import 'package:wasla_app/app/features/navbar/views/navbar_view.dart';
import 'package:wasla_app/app/features/notifications/bindings/notification_binding.dart';
import 'package:wasla_app/app/features/notifications/views/notification_view.dart';
import 'package:wasla_app/app/features/product_details/bindings/product_details_binding.dart';
import 'package:wasla_app/app/features/product_details/views/product_details_view.dart';
import 'package:wasla_app/app/features/profile/bindings/profile_binding.dart';
import 'package:wasla_app/app/features/profile/views/profile_view.dart';
import 'package:wasla_app/app/features/search/bindings/search_binding.dart';
import 'package:wasla_app/app/features/search/views/search_view.dart';
import 'package:wasla_app/app/features/unknow/views/unknow_view.dart';
import 'package:wasla_app/app/features/users_reviews/bindings/users_reviews_binding.dart';
import 'package:wasla_app/app/features/users_reviews/views/users_reviews_view.dart';
import '../../app/features/about/bindings/about_binding.dart';
import '../../app/features/my_address/views/add_new_address_view.dart';
import '../../app/features/onboarding/bindings/onboarding_binding.dart';
import '../../app/features/onboarding/views/onboarding_view.dart';
import '../../app/features/product_details/views/product_reviews_view.dart';
import '../../app/features/settings/bindings/settings_binding.dart';
import '../../app/features/settings/views/settings_view.dart';
import '../../app/features/splash/views/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgetPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.navbar,
      page: () => NavbarView(),
      binding: BindingsBuilder(() {
        NavbarBinding().dependencies();
        HomeBinding().dependencies();
        MenuBinding().dependencies();
        SearchBinding().dependencies();
        NotificationBinding().dependencies();
        ProfileBinding().dependencies();
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.coupons,
      page: () => CouponsView(),
      binding: CouponsBinding(),
    ),
    GetPage(
      name: AppRoutes.menu,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.customerSupport,
      page: () => CustomerSupportView(),
      binding: CustomerSupportBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.mediaViewer,
      page: () => MediaViewerView(),
      binding: MediaViewerBinding(),
    ),
    GetPage(
      name: AppRoutes.faqs,
      page: () => FAQsView(),
      binding: FAQsBinding(),
    ),
    GetPage(
        name: AppRoutes.myAddress,
        page: () => MyAddressView(),
        binding: MyAddressBinding()),
    GetPage(
        name: AppRoutes.addNewAddress,
        page: () => AddNewAddressView(),
        binding: MyAddressBinding()),
    GetPage(
        name: AppRoutes.settings,
        page: () => SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: AppRoutes.usersReviews,
        page: () => UsersReviewsView(),
        binding: UsersReviewsBinding()),
    GetPage(
        name: AppRoutes.productDetails,
        page: () => ProductDetailsView(),
        binding: ProductDetailsBinding()),
    GetPage(
        name: AppRoutes.about,
        page: () => AboutView(),
        binding: AboutBinding()),
    GetPage(
      name: AppRoutes.productReviews,
      page: () => ProductReviewsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.favorite,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.unknow,
      page: () => UnKnowView(),
    ),
  ];
}
