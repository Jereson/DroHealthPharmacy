import 'package:drohealthpharm/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'productItem_widget.dart';

class ProductGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false).items;
    return GridView.builder(
      itemCount: productsProvider.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: productsProvider[index],
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ProductItemWidget(),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
