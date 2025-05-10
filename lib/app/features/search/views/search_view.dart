import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/model/category_model.dart';
import 'package:wasla_app/app/features/home/widgtes/product_item_widget.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../../../core/strings_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../home/model/product_model.dart';

// class SearchView extends StatelessWidget {
//   const SearchView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWidget(title: StringsManager.searchText),
//     );
//   }
// }

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final List<String> _searchHistory = [];

  late final List<CategoryModel> categories = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.searchText,
        actions: [
          IconButton(
            icon: const Icon(Icons.search,
              color: ColorManager.whiteColor,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  allProducts: categories.expand((c) => c.products).toList(),
                  searchHistory: _searchHistory,
                  onSearch: (query) {
                    if (query.trim().isEmpty) return;
                    setState(() {
                      _searchHistory.remove(query);
                      _searchHistory.insert(0, query);
                      if (_searchHistory.length > 10) {
                        _searchHistory.removeLast();
                      }
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('اضغط على أيقونة البحث')),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate {
  final List<ProductModel> allProducts;
  final List<String> searchHistory;
  final Function(String query) onSearch;

  ProductSearchDelegate({
    required this.allProducts,
    required this.searchHistory,
    required this.onSearch,
  });

  @override
  String get searchFieldLabel => 'ابحث عن منتج';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () => query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = searchHistory
        .where((h) => h.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: [
        if (suggestions.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('عمليات البحث الأخيرة',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ...suggestions.map((item) => ListTile(
              title: Text(item),
              leading: const Icon(Icons.history),
              onTap: () {
                query = item;
                showResults(context);
              },
            )),
      ],
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    // تأجيل استدعاء onSearch لتجنب الخطأ
    Future.microtask(() => onSearch(query));

    final filteredProducts = allProducts.where((product) {
      final name = product.name.toLowerCase();
      final q = query.toLowerCase();
      return name.contains(q);
    }).toList();

    if (filteredProducts.isEmpty) {
      return const Center(child: Text('لا توجد نتائج'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return ProductItemWidget(product: product);
      },
    );
  }
  //
  // @override
  // Widget buildResults(BuildContext context) {
  //   onSearch(query);
  //
  //   final filteredProducts = allProducts.where((product) {
  //     final name = product.name.toLowerCase();
  //     final q = query.toLowerCase();
  //     return name.contains(q);
  //   }).toList();
  //
  //   if (filteredProducts.isEmpty) {
  //     return const Center(child: Text('لا توجد نتائج'));
  //   }
  //
  //   return GridView.builder(
  //     padding: const EdgeInsets.all(12),
  //     itemCount: filteredProducts.length,
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       mainAxisSpacing: 10,
  //       crossAxisSpacing: 10,
  //       childAspectRatio: 0.7,
  //     ),
  //     itemBuilder: (context, index) {
  //       final product = filteredProducts[index];
  //       return Card(
  //         child: Column(
  //           children: [
  //             Image.network(product.imageUrl, height: 100, fit: BoxFit.cover),
  //             const SizedBox(height: 8),
  //             Text(product.name,
  //                 style: const TextStyle(fontWeight: FontWeight.bold)),
  //             const SizedBox(height: 4),
  //             Text('${product.price.toStringAsFixed(2)} ل.س'),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
