import 'package:flutter/material.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/strings_manager.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.addNewAddressText,
      ),
      body: Center(),
    );
  }
}
