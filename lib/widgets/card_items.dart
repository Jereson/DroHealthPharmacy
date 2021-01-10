import 'package:drohealthpharm/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    Key key,
    @required this.product,
    @required this.styles,
  }) : super(key: key);

  final Product product;
  final TextStyle styles;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.withOpacity(0.6),
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 12.0),
            alignment: Alignment.bottomCenter,
            height: 140.0,
            width: 120,
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
            ),
          ),

          //Product Detial
          SizedBox(height: 18.0),
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.constituents,
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
                Text(product.id, style: styles),
                Text(
                  product.description,
                  style: styles,
                ),
              ],
            ),
          ),

          //Product price
          Container(
            padding: EdgeInsets.only(top: 12.0, right: 10.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 26.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF909090),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '\$${product.price}',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ProximaNova',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
