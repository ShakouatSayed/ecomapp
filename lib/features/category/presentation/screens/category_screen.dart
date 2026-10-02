import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nab_holder_provider.dart';
import '../../../shared/presentation/widget/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _backToHome(),

      child: Scaffold(
        appBar: AppBar(
          title: Text('Category'),
          leading: IconButton(
            onPressed: () => _backToHome(),
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: CategoryItem());
          },
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
