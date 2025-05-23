import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/model/category_model.dart';
import 'package:wasla_app/app/features/home/model/product_model.dart';

import '../model/carousel_home_item_model.dart';

class HomeController extends GetxController {
  RxList<CarouselHomeItemModel> carouselHomeItems = <CarouselHomeItemModel>[
    CarouselHomeItemModel(
      image:
          'https://imgs.search.brave.com/fHuioB0Gbpb2pHRE6CyRGCuLXUx8sFWyuBYJS-VvXCQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vc3RvcmFn/ZS5nb29nbGVhcGlz/LmNvbS80ODg3NzEx/OC03MjcyLTRhNGQt/YjMwMi0wNDY1ZDhh/YTQ1NDgvMDVhYWRj/YTMtYmU5Yi00MTYy/LWI0ZWUtZWQ0MzYx/MDkxNzUzLzU3ZWJk/YmM4LTA5ZDgtNGYy/YS1hMjk5LWM4Nzc3/ZGUxOTFhYS5qcGc_/dz04MDAmc3NsPTE',
      text: 'توصيل سريع لجميع المناطق!',
    ),
    CarouselHomeItemModel(
      image:
          'https://imgs.search.brave.com/cRnaXIOX_S10OIOO-biW6lVU6z5nenqeNgWStKfszms/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vZS10ZWph/cmEuY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE1LzAzL2Ny/ZWRpdC1jYXJkLW51/bWJlcnMtd2l0aC1j/dnYuanBnP3Jlc2l6/ZT03MDgsMzU1JnNz/bD0x',
      text: 'دفع آمن بوسائل متعددة',
    ),
    CarouselHomeItemModel(
      image:
          'https://imgs.search.brave.com/-aeJXxc3AzRmBBFY54FFs-EGW_HVjONqwwhiIIvPRMI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zYS1q/ZXdlbC5jb20vY2Ru/L3Nob3AvZmlsZXMv/MjQ5YjAzZjZkMzE1/NDZhZDkxYTg5OTQ2/YTJlMzNkYjIuanBn/P3Y9MTczNzU1NDUz/MyZ3aWR0aD0xMTAw',
      text: 'شنط نسائية بتصاميم فريدة',
    ),
    CarouselHomeItemModel(
      image:
          'https://imgs.search.brave.com/8EDxiRCWXOzH1wvvMWKWx8Z3qIiAvP5FHiybBZEbmEY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLmlt/Z3VyLmNvbS9LWkoz/aUkxLmpwZw',
      text: 'أزياء رجالية شبابية من Shein',
    ),
  ].obs;

  RxList<CategoryModel> categoriesList = <CategoryModel>[
    CategoryModel(
      id: 'cat1',
      name: 'ملابس رجالية',
      // imageUrl: 'https://picsum.photos/id/1011/400/200',
      imageUrl: 'https://www.svgrepo.com/download/327535/shirt.svg',
      products: [
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
      ],
    ),
    CategoryModel(
      id: 'cat2',
      name: 'ملابس نسائية',
      // imageUrl: 'https://picsum.photos/id/1016/400/200',
      imageUrl: 'https://www.svgrepo.com/download/46435/long-party-dress.svg',
      products: [
        ProductModel(
          id: 'p3',
          name: 'فستان سهرة',
          imageUrl: 'https://picsum.photos/id/1018/200/200',
          price: 249.99,
        ),
        ProductModel(
          id: 'p4',
          name: 'بلوزة حرير',
          imageUrl: 'https://picsum.photos/id/1020/200/200',
          price: 129.99,
        ),
        ProductModel(
          id: 'p3',
          name: 'فستان سهرة',
          imageUrl: 'https://picsum.photos/id/1018/200/200',
          price: 249.99,
        ),
        ProductModel(
          id: 'p4',
          name: 'بلوزة حرير',
          imageUrl: 'https://picsum.photos/id/1020/200/200',
          price: 129.99,
        ),
        ProductModel(
          id: 'p3',
          name: 'فستان سهرة',
          imageUrl: 'https://picsum.photos/id/1018/200/200',
          price: 249.99,
        ),
        ProductModel(
          id: 'p4',
          name: 'بلوزة حرير',
          imageUrl: 'https://picsum.photos/id/1020/200/200',
          price: 129.99,
        ),
        ProductModel(
          id: 'p3',
          name: 'فستان سهرة',
          imageUrl: 'https://picsum.photos/id/1018/200/200',
          price: 249.99,
        ),
        ProductModel(
          id: 'p4',
          name: 'بلوزة حرير',
          imageUrl: 'https://picsum.photos/id/1020/200/200',
          price: 129.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat3',
      name: 'أحذية',
      // imageUrl: 'https://picsum.photos/id/1021/400/200',
      imageUrl: 'https://www.svgrepo.com/download/42885/sport-shoe.svg',
      products: [
        ProductModel(
          id: 'p5',
          name: 'حذاء رياضي',
          imageUrl: 'https://picsum.photos/id/1025/200/200',
          price: 149.99,
        ),
        ProductModel(
          id: 'p6',
          name: 'كعب نسائي',
          imageUrl: 'https://picsum.photos/id/1026/200/200',
          price: 189.99,
        ),
        ProductModel(
          id: 'p5',
          name: 'حذاء رياضي',
          imageUrl: 'https://picsum.photos/id/1025/200/200',
          price: 149.99,
        ),
        ProductModel(
          id: 'p6',
          name: 'كعب نسائي',
          imageUrl: 'https://picsum.photos/id/1026/200/200',
          price: 189.99,
        ),
        ProductModel(
          id: 'p5',
          name: 'حذاء رياضي',
          imageUrl: 'https://picsum.photos/id/1025/200/200',
          price: 149.99,
        ),
        ProductModel(
          id: 'p6',
          name: 'كعب نسائي',
          imageUrl: 'https://picsum.photos/id/1026/200/200',
          price: 189.99,
        ),
        ProductModel(
          id: 'p5',
          name: 'حذاء رياضي',
          imageUrl: 'https://picsum.photos/id/1025/200/200',
          price: 149.99,
        ),
        ProductModel(
          id: 'p6',
          name: 'كعب نسائي',
          imageUrl: 'https://picsum.photos/id/1026/200/200',
          price: 189.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat4',
      name: 'إلكترونيات',
      // imageUrl: 'https://picsum.photos/id/1031/400/200',
      imageUrl: 'https://www.svgrepo.com/download/528340/laptop.svg',
      products: [
        ProductModel(
          id: 'p7',
          name: 'سماعات بلوتوث',
          imageUrl: 'https://picsum.photos/id/1032/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p8',
          name: 'ماوس لاسلكي',
          imageUrl: 'https://picsum.photos/id/1033/200/200',
          price: 49.99,
        ),
        ProductModel(
          id: 'p7',
          name: 'سماعات بلوتوث',
          imageUrl: 'https://picsum.photos/id/1032/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p8',
          name: 'ماوس لاسلكي',
          imageUrl: 'https://picsum.photos/id/1033/200/200',
          price: 49.99,
        ),
        ProductModel(
          id: 'p7',
          name: 'سماعات بلوتوث',
          imageUrl: 'https://picsum.photos/id/1032/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p8',
          name: 'ماوس لاسلكي',
          imageUrl: 'https://picsum.photos/id/1033/200/200',
          price: 49.99,
        ),
        ProductModel(
          id: 'p7',
          name: 'سماعات بلوتوث',
          imageUrl: 'https://picsum.photos/id/1032/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p8',
          name: 'ماوس لاسلكي',
          imageUrl: 'https://picsum.photos/id/1033/200/200',
          price: 49.99,
        ),
        ProductModel(
          id: 'p7',
          name: 'سماعات بلوتوث',
          imageUrl: 'https://picsum.photos/id/1032/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p8',
          name: 'ماوس لاسلكي',
          imageUrl: 'https://picsum.photos/id/1033/200/200',
          price: 49.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat5',
      name: 'هواتف محمولة',
      // imageUrl: 'https://picsum.photos/id/1040/400/200',
      imageUrl: 'https://www.svgrepo.com/download/379074/mobile-phone.svg',
      products: [
        ProductModel(
          id: 'p9',
          name: 'iPhone 14',
          imageUrl: 'https://picsum.photos/id/1041/200/200',
          price: 1099.99,
        ),
        ProductModel(
          id: 'p10',
          name: 'Samsung Galaxy S22',
          imageUrl: 'https://picsum.photos/id/1042/200/200',
          price: 999.99,
        ),
        ProductModel(
          id: 'p9',
          name: 'iPhone 14',
          imageUrl: 'https://picsum.photos/id/1041/200/200',
          price: 1099.99,
        ),
        ProductModel(
          id: 'p10',
          name: 'Samsung Galaxy S22',
          imageUrl: 'https://picsum.photos/id/1042/200/200',
          price: 999.99,
        ),
        ProductModel(
          id: 'p9',
          name: 'iPhone 14',
          imageUrl: 'https://picsum.photos/id/1041/200/200',
          price: 1099.99,
        ),
        ProductModel(
          id: 'p10',
          name: 'Samsung Galaxy S22',
          imageUrl: 'https://picsum.photos/id/1042/200/200',
          price: 999.99,
        ),
        ProductModel(
          id: 'p9',
          name: 'iPhone 14',
          imageUrl: 'https://picsum.photos/id/1041/200/200',
          price: 1099.99,
        ),
        ProductModel(
          id: 'p10',
          name: 'Samsung Galaxy S22',
          imageUrl: 'https://picsum.photos/id/1042/200/200',
          price: 999.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat6',
      name: 'أجهزة منزلية',
      // imageUrl: 'https://picsum.photos/id/1050/400/200',
      imageUrl: 'https://www.svgrepo.com/download/108862/vacuum-cleaner-machine.svg',
      products: [
        ProductModel(
          id: 'p11',
          name: 'خلاط كهربائي',
          imageUrl: 'https://picsum.photos/id/1051/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p12',
          name: 'مكنسة كهربائية',
          imageUrl: 'https://picsum.photos/id/1052/200/200',
          price: 499.99,
        ),
        ProductModel(
          id: 'p11',
          name: 'خلاط كهربائي',
          imageUrl: 'https://picsum.photos/id/1051/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p12',
          name: 'مكنسة كهربائية',
          imageUrl: 'https://picsum.photos/id/1052/200/200',
          price: 499.99,
        ),
        ProductModel(
          id: 'p11',
          name: 'خلاط كهربائي',
          imageUrl: 'https://picsum.photos/id/1051/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p12',
          name: 'مكنسة كهربائية',
          imageUrl: 'https://picsum.photos/id/1052/200/200',
          price: 499.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat7',
      name: 'أثاث',
      // imageUrl: 'https://picsum.photos/id/1060/400/200',
      imageUrl: 'https://www.svgrepo.com/download/5891/vintage-armchair.svg',
      products: [
        ProductModel(
          id: 'p13',
          name: 'طاولة قهوة',
          imageUrl: 'https://picsum.photos/id/1061/200/200',
          price: 259.99,
        ),
        ProductModel(
          id: 'p14',
          name: 'كنبة 3 مقاعد',
          imageUrl: 'https://picsum.photos/id/1062/200/200',
          price: 799.99,
        ),
        ProductModel(
          id: 'p13',
          name: 'طاولة قهوة',
          imageUrl: 'https://picsum.photos/id/1061/200/200',
          price: 259.99,
        ),
        ProductModel(
          id: 'p14',
          name: 'كنبة 3 مقاعد',
          imageUrl: 'https://picsum.photos/id/1062/200/200',
          price: 799.99,
        ),
        ProductModel(
          id: 'p13',
          name: 'طاولة قهوة',
          imageUrl: 'https://picsum.photos/id/1061/200/200',
          price: 259.99,
        ),
        ProductModel(
          id: 'p14',
          name: 'كنبة 3 مقاعد',
          imageUrl: 'https://picsum.photos/id/1062/200/200',
          price: 799.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat8',
      name: 'مستحضرات تجميل',
      // imageUrl: 'https://picsum.photos/id/1070/400/200',
      imageUrl: 'https://www.svgrepo.com/download/16887/lipstick.svg',
      products: [
        ProductModel(
          id: 'p15',
          name: 'كريم أساس',
          imageUrl: 'https://picsum.photos/id/1071/200/200',
          price: 59.99,
        ),
        ProductModel(
          id: 'p16',
          name: 'أحمر شفاه',
          imageUrl: 'https://picsum.photos/id/1072/200/200',
          price: 39.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat9',
      name: 'عطور',
      // imageUrl: 'https://picsum.photos/id/1080/400/200',
      imageUrl: 'https://www.svgrepo.com/download/482597/perfume-4.svg',
      products: [
        ProductModel(
          id: 'p17',
          name: 'عطر رجالي فاخر',
          imageUrl: 'https://picsum.photos/id/1081/200/200',
          price: 229.99,
        ),
        ProductModel(
          id: 'p18',
          name: 'عطر نسائي مميز',
          imageUrl: 'https://picsum.photos/id/1082/200/200',
          price: 199.99,
        ),
        ProductModel(
          id: 'p17',
          name: 'عطر رجالي فاخر',
          imageUrl: 'https://picsum.photos/id/1081/200/200',
          price: 229.99,
        ),
        ProductModel(
          id: 'p18',
          name: 'عطر نسائي مميز',
          imageUrl: 'https://picsum.photos/id/1082/200/200',
          price: 199.99,
        ),
        ProductModel(
          id: 'p17',
          name: 'عطر رجالي فاخر',
          imageUrl: 'https://picsum.photos/id/1081/200/200',
          price: 229.99,
        ),
        ProductModel(
          id: 'p18',
          name: 'عطر نسائي مميز',
          imageUrl: 'https://picsum.photos/id/1082/200/200',
          price: 199.99,
        ),
      ],
    ),
    CategoryModel(
      id: 'cat10',
      name: 'ساعات وإكسسوارات',
      // imageUrl: 'https://picsum.photos/id/1090/400/200',
      imageUrl: 'https://www.svgrepo.com/download/377118/watch.svg',
      products: [
        ProductModel(
          id: 'p19',
          name: 'ساعة يد كلاسيكية',
          imageUrl: 'https://picsum.photos/id/1091/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p20',
          name: 'نظارات شمسية',
          imageUrl: 'https://picsum.photos/id/1092/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p19',
          name: 'ساعة يد كلاسيكية',
          imageUrl: 'https://picsum.photos/id/1091/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p20',
          name: 'نظارات شمسية',
          imageUrl: 'https://picsum.photos/id/1092/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p19',
          name: 'ساعة يد كلاسيكية',
          imageUrl: 'https://picsum.photos/id/1091/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p20',
          name: 'نظارات شمسية',
          imageUrl: 'https://picsum.photos/id/1092/200/200',
          price: 89.99,
        ),
        ProductModel(
          id: 'p19',
          name: 'ساعة يد كلاسيكية',
          imageUrl: 'https://picsum.photos/id/1091/200/200',
          price: 299.99,
        ),
        ProductModel(
          id: 'p20',
          name: 'نظارات شمسية',
          imageUrl: 'https://picsum.photos/id/1092/200/200',
          price: 89.99,
        ),
      ],
    ),

    // ⚠️ أكمل الفئات من 11 إلى 20 بنفس الطريقة حسب حاجتك
  ].obs;

  List<ProductModel> get favoriteProducts {
    final List<ProductModel> allProducts =
        categoriesList.expand((category) => category.products).toList();

    return allProducts
        .where(
          (product) => product.isFav.value,
        )
        .toList();
  }

  final Rx<Offset> fabPosition = Offset.zero.obs;
  RxInt itemCount = 0.obs;
  RxInt activeIndex = 0.obs;
  int activeCategoryIndex = 0;
  final RxBool isDragging = false.obs;

  void setInitialPosition(Size screenSize) {
    fabPosition.value = Offset(screenSize.width - 72, screenSize.height - 72);
  }

  void updatePosition(DragUpdateDetails details, Size screenSize) {
    double dx = fabPosition.value.dx + details.delta.dx;
    double dy = fabPosition.value.dy + details.delta.dy;

    dx = dx.clamp(0.0, screenSize.width - 56);
    dy = dy.clamp(0.0, screenSize.height - 56);

    fabPosition.value = Offset(dx, dy);
  }

  void startDragging() {
    isDragging.value = true;
  }

  void stopDragging() {
    isDragging.value = false;
  }

  void addItem() {
    itemCount.value++;
  }

  void removeItem() {
    if (itemCount.value > 0) itemCount.value--;
  }

  void onPageChanged(int index) {
    activeIndex.value = index;
  }

  void changeCategoryIndex(int index) {
    activeCategoryIndex = index;
    update();
  }

  List<String> getCustomPrice(double price) {
    String priceStr = price.toStringAsFixed(2);
    return priceStr.split('.');
  }

  bool isCurrentCategoryIndex(index) => activeCategoryIndex == index;

  bool isFavorite(isFav) {
    return isFav = !isFav;
  }

  @override
  void onInit() {
    addItem();
    super.onInit();
  }
}
