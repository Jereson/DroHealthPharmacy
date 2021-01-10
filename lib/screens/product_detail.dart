import 'package:drohealthpharm/models/bag.dart';
import 'package:drohealthpharm/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drohealthpharm/custom/custom_alert.dart' as alert;

class ProductDetail extends StatefulWidget {
  static const routName = '/product-detail';

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counter = 0;
  int _mainCount;

  @override
  void initState() {
    super.initState();
    // var _increaseCount = Provider.of<Product>(context, listen: false).count;
    // _increaseCount = _counter;
    // _mainCount = _increaseCount + _counter;
  }

  @override
  Widget build(BuildContext context) {
    var _itemCout = Provider.of<Bag>(context, listen: false).itemCount;
    void updateQuatityadPrice() {
      setState(() {
        _counter++;
        // _mainCount = _mainCount + 1;
        // _price = _price + _mainCount;
      });
    }

    //Instances all providers
    final _productTitle = ModalRoute.of(context).settings.arguments as String;
    final _loadProduct = Provider.of<ProductProvider>(
      context,
      listen: false,
    ).getProductDetail(_productTitle);

    var totalPrice = Provider.of<Bag>(context, listen: false).totalAmount;

    //Increase Quantity and price

    const _itemSize = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13.0,
    );

    const _headings = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
      color: Color(0xFF909090),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Color(0xFF9F5DE2),
                  borderRadius: BorderRadius.circular(10.0)),
              // height: 30,
              width: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Text(
                    '$_itemCout',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                height: 140.0,
                width: double.infinity,
                child: Image.asset(
                  _loadProduct.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 18.0),
              Text(
                _loadProduct.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                _loadProduct.description,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 22.0),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(0xFF909090),
                    radius: 23.0,
                  ),
                  SizedBox(width: 18.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'SOLD BY',
                        style: TextStyle(
                          color: Color(0xFF909090),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const Text(
                        'Emzor Pharmaceticals',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 22.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        margin: const EdgeInsets.only(right: 6.0),
                        height: 40.0,
                        width: 105.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF909090),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () => updateQuatityadPrice,
                              child: Icon(
                                Icons.remove,
                                color: _counter == 0
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              '$_counter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            InkWell(
                              onTap: () => updateQuatityadPrice(),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Pack(s)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Color(0xFF909090),
                        ),
                      ),
                    ],
                  ),

                  //Product Price
                  Text(
                    '$totalPrice',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.0),
              const Text(
                'PRODUCT DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: Color(0xFF909090),
                ),
              ),
              SizedBox(height: 6.0),
              //Pack Size, Product in Row
              Container(
                width: MediaQuery.of(context).size.width * .78,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Prize Size
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.label_outline,
                            color: Color(0xFF9F5DE2),
                            size: 32.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'PACK SIZE',
                              style: _headings,
                            ),
                            Text(
                              _loadProduct.size,
                              style: _itemSize,
                            )
                          ],
                        ),
                      ],
                    ),

                    //Product ID
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.dashboard,
                            color: Color(0xFF9F5DE2),
                            size: 40.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('PRODUCT ID', style: _headings),
                            Text(
                              _loadProduct.id,
                              style: _itemSize,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Constituents
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.label,
                      color: Color(0xFF9F5DE2),
                      size: 32.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'CONSTITUENTS',
                        style: _headings,
                      ),
                      Text(
                        _loadProduct.constituents,
                        style: _itemSize,
                      )
                    ],
                  ),
                ],
              ),

              //Dispensed
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.delete_outline,
                      color: Color(0xFF9F5DE2),
                      size: 35.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('DISPENSE', style: _headings),
                      Text(
                        _loadProduct.designId,
                        style: _itemSize,
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 14.0),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  '1 ' +
                      _loadProduct.designId +
                      ' of ' +
                      _loadProduct.constituents +
                      ' contain ' +
                      _loadProduct.size,
                  style: TextStyle(color: Color(0xFF909090)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert.RichAlertDialog(
                  //uses the custom alert dialog
                  alertTitle: alert.richTitle("Successful"),
                  alertSubtitle: alert.richSubtitle("j fsgdj ghd "),
                  alertType: alert.RichAlertType.SUCCESS,
                );
              });
        },
        child: Container(
          height: 40.0,
          width: MediaQuery.of(context).size.width * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color(0xFF9F5DE2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
