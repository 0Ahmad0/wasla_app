import 'package:flutter/material.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../../../core/strings_manager.dart';
import '../../../widgets/app_bar_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: StringsManager.searchText),
    );
  }
}
