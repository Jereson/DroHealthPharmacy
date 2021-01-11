import 'package:drohealthpharm/models/bag.dart';
import 'package:drohealthpharm/models/product.dart';
import 'package:drohealthpharm/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drohealthpharm/widgets/card_items.dart';

class SearchItems extends StatelessWidget {
  final styles = TextStyle(
    fontFamily: 'ProximaNova',
    fontSize: 12.0,
    color: Color(0xFF909090),
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    var _bag = Provider.of<Bag>(context, listen: false);
    final products = Provider.of<Product>(context);

    return GestureDetector(
      onTap: () {
        var _product = Provider.of<Product>(context, listen: false);
        _bag.addItem(
          _product.id,
          _product.title,
          _product.constituents,
          _product.price,
          _product.image,
        );
        Navigator.of(context)
            .pushNamed(ProductDetail.routName, arguments: products.title);
      },
      child: CardItems(product: products, styles: styles),
    );
  }
}
