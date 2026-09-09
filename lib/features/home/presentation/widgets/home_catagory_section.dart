import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/category_item.dart';

class HomeCatagorySection extends StatelessWidget {
  const HomeCatagorySection({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CategoryItem();
      },
    );
  }
}
