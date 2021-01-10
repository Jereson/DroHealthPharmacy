import 'package:drohealthpharm/models/bag.dart';
import 'package:drohealthpharm/models/product.dart';
import 'package:drohealthpharm/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drohealthpharm/widgets/card_items.dart';

class SearchItems extends StatelessWidget {
  // final String id;
  // final String constituent;
  // final String description;
  // final double price;
  // final String image;

  // SearchItems(
  //     this.id, this.constituent, this.description, this.price, this.image);

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
      // child: Card(
      //   shadowColor: Colors.grey.withOpacity(0.6),
      //   elevation: 2.0,
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         padding: const EdgeInsets.only(top: 12.0),
      //         alignment: Alignment.bottomCenter,
      //         height: 140.0,
      //         width: 120,
      //         child: Image.asset(
      //           products.image,
      //           fit: BoxFit.contain,
      //         ),
      //       ),

      //       //Product Detial
      //       SizedBox(height: 18.0),
      //       Container(
      //         padding: const EdgeInsets.only(left: 8.0),
      //         alignment: Alignment.centerLeft,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Text(
      //               products.id,
      //               style: TextStyle(
      //                 fontFamily: 'ProximaNova',
      //                 fontWeight: FontWeight.w700,
      //                 fontSize: 14.0,
      //               ),
      //             ),
      //             Text(products.constituents, style: styles),
      //             Text(
      //               products.description,
      //               style: styles,
      //             ),
      //           ],
      //         ),
      //       ),

      //       //Product price
      //       Container(
      //         padding: EdgeInsets.only(top: 12.0, right: 10.0, bottom: 8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: <Widget>[
      //             Container(
      //               alignment: Alignment.center,
      //               height: 26.0,
      //               width: 70.0,
      //               decoration: BoxDecoration(
      //                 color: Color(0xFF909090),
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               child: Text(
      //                 '\$${products.price}',
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontFamily: 'ProximaNova',
      //                     fontSize: 12.0,
      //                     fontWeight: FontWeight.w400),
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
