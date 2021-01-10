import 'package:drohealthpharm/provider/product_provider.dart';
import 'package:drohealthpharm/screens/search_screen.dart';
import 'package:drohealthpharm/widgets/productGrid_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drohealthpharm/widgets/homeItems_widgets.dart';

class ProductOverview extends StatelessWidget {
  static const routName = '/overView';

  //Space Icons Row
  Widget iconSpace() => SizedBox(width: 30.0);

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false).items;
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          title: Text(
            '${productsProvider.length} Item(s)',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            //call Home Icons Widgets
            homeIconWidget(context),
            SizedBox(height: 10.0),
            Expanded(child: ProductGridWidget()),
          ],
        ),
        bottomSheet: bottomSheet(productsProvider.length));
  }
}
