import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/model/product_model.dart';

class SearchAppController extends GetxController {
  final searchController = TextEditingController();
  Timer? _debounceTimer;
  List<ProductModel> allProducts = [
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
  ];
  List<ProductModel> searchResults = [];
  List<String> searchHistory = [];

  bool isSearching = false;
  RxBool hasText = false.obs;

  SearchAppController() {
    searchController.addListener(() {
      hasText.value = searchController.text.isNotEmpty;
    });
  }
  void search(String query, {bool fromHistory = false, bool isSubmit = false}) {
    query = query.trim();

    if (isSubmit || fromHistory) {
      _debounceTimer?.cancel();
      _performSearch(query, fromHistory: fromHistory);
    } else {
      if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

      _debounceTimer = Timer(const Duration(seconds: 3), () {
        _performSearch(query);
      });
    }
  }

  void _performSearch(String query, {bool fromHistory = false}) {
    if (query.isEmpty) {
      isSearching = false;
      searchResults = [];
    } else if (query.isNotEmpty) {
      isSearching = true;
      searchResults = allProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (!fromHistory) {
        addToHistory(query);
      }
    } else {
      isSearching = false;
      searchResults = [];
    }
    update();
  }

  void addToHistory(String query) {
    searchHistory.remove(query);
    searchHistory.insert(0, query);

    if (searchHistory.length > 10) {
      searchHistory = searchHistory.sublist(0, 10);
    }
  }

  void deleteHistoryItem(String query) {
    searchHistory.remove(query);
    update();
  }

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
    isSearching = false;
    _debounceTimer?.cancel();
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    _debounceTimer?.cancel();
    super.onClose();
  }
}
