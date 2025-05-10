import 'package:get/get.dart';

import '../../home/model/category_model.dart';
import '../../home/model/product_model.dart';

class SearchController extends GetxController{
  List<CategoryModel> categoriesList = <CategoryModel>[
    CategoryModel(
      id: 'cat1',
      name: 'ملابس رجالية',
      imageUrl: 'https://picsum.photos/id/1011/400/200',
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
      imageUrl: 'https://picsum.photos/id/1016/400/200',
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
      imageUrl: 'https://picsum.photos/id/1021/400/200',
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
      imageUrl: 'https://picsum.photos/id/1031/400/200',
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
      imageUrl: 'https://picsum.photos/id/1040/400/200',
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
      imageUrl: 'https://picsum.photos/id/1050/400/200',
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
      imageUrl: 'https://picsum.photos/id/1060/400/200',
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
      imageUrl: 'https://picsum.photos/id/1070/400/200',
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
      imageUrl: 'https://picsum.photos/id/1080/400/200',
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
      imageUrl: 'https://picsum.photos/id/1090/400/200',
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
  ];

  var searchHistory = <String>[].obs;

  List<CategoryModel> searchCategories(String query) {
    final q = query.toLowerCase().trim();
    return categoriesList.where((c) => c.name.toLowerCase().contains(q)).toList();
  }

  void addToSearchHistory(String query) {
    query = query.trim();
    if (query.isEmpty) return;
    searchHistory.remove(query);
    searchHistory.insert(0, query);
    if (searchHistory.length > 10) {
      searchHistory.removeLast();
    }
  }

}