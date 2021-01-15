import 'package:drohealthpharm/models/bag.dart';
import 'package:drohealthpharm/screens/product_overview.dart';
import 'package:drohealthpharm/widgets/bag_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBag extends StatefulWidget {
  static const routName = '/bag';

  @override
  _MyBagState createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    int _counter = 1;
    final bag = Provider.of<Bag>(context);
    const totalStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    

        var newUpdate = Provider.of<Bag>(context);
    var totalPrice = newUpdate.updatePrice(_counter);
    var _itemCout = newUpdate.updateQuantity(_counter);

    void updateQuatityadPrice() {
      setState(() {
        _counter++;
        totalPrice = totalPrice * _counter;
        _itemCout = _itemCout + _counter;
      });
    }
    return Scaffold(
      backgroundColor: Color(0xFF7B4397),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF7B4397),
        elevation: 0.0,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 4.0),
          Text('Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0))
        ]),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('${bag.items.length}')),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 30.0,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
            child: const Text(
              'Tab and item for add, remove, delete option',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bag.items.length,
              itemBuilder: (ctx, i) => BagSummary(
                bag.items.keys.toList()[i],
                bag.items.values.toList()[i].title,
                bag.items.values.toList()[i].constituent,
                bag.items.values.toList()[i].price,
                bag.items.values.toList()[i].quantity,
                bag.items.values.toList()[i].image,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        color: Color(0xFF7B4397),
        height: 110.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Total',
                  style: totalStyle,
                ),
                Spacer(),
                Text(
                  '\$${bag.totalAmount}',
                  style: totalStyle,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              height: 44.0,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
              ),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ProductOverview.routName);
                  },
                  child: Text('Checkout',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0))),
            ),
          ],
        ),
      ),
    );
  }
}
