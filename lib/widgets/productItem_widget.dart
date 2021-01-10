import 'package:drohealthpharm/models/bag.dart';
import 'package:drohealthpharm/models/product.dart';
import 'package:drohealthpharm/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'card_items.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    var _bag = Provider.of<Bag>(context, listen: false);
    var _product = Provider.of<Product>(context, listen: false);

    final styles = TextStyle(
      fontFamily: 'ProximaNova',
      fontSize: 12.0,
      color: Color(0xFF909090),
      fontWeight: FontWeight.w300,
    );
    return GridTile(
      child: GestureDetector(
        onTap: () {
          _bag.addItem(
            _product.id,
            _product.title,
            _product.constituents,
            _product.price,
            _product.image,
          );
          Navigator.of(context)
              .pushNamed(ProductDetail.routName, arguments: product.title);
        },
        child: CardItems(product: product, styles: styles),
      ),
    );
  }
}
