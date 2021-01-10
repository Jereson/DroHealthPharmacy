import 'package:drohealthpharm/screens/search_screen.dart';
import 'package:flutter/material.dart';

Widget homeIconWidget(BuildContext context) {
  //Space Icons Row
  Widget iconSpace() => SizedBox(width: 30.0);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        radius: 24.0,
        child: Icon(
          Icons.import_export,
          color: Colors.black,
        ),
      ),
      iconSpace(),
      CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        radius: 24.0,
        child: Image.asset('assets/images/filter.png'),
      ),
      iconSpace(),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SearchScreen();
          }));
        },
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.3),
          radius: 24.0,
          child: Image.asset('assets/images/Search.png'),
        ),
      ),
    ],
  );
}

Widget bottomSheet(int lenght) {
  return Container(
    height: 70.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xFF9F5DE2),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.0),
        topLeft: Radius.circular(30.0),
      ),
    ),
    child: Column(
      children: <Widget>[
        Icon(
          Icons.maximize,
          color: Colors.white,
          size: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.0),
                  const Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16.0,
                child: Text(
                  '$lenght',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
