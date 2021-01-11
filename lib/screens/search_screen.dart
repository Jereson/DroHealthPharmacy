import 'package:drohealthpharm/provider/product_provider.dart';
import 'package:drohealthpharm/widgets/search_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drohealthpharm/widgets/homeItems_widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _userInput = '';
  var _count;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final getUser = Provider.of<ProductProvider>(context, listen: false).items;

    void updateTitle() {
      _userInput = _searchController.text;
    }

    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          //Numberd of items fetched
          title: Text(
            _count == null || _userInput.isEmpty
                ? '0 items'
                : '$_count Item(s)',
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: Color(
                    0xFF909090,
                  ),
                ),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    updateTitle();
                    _count = getUser.length;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: FlatButton(
                    child: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        updateTitle();
                      });
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            Expanded(
                child:
                    //Using a common logic to search for items
                    //without using FutureBuilder
                    GridView.builder(
              itemCount: getUser.length,
              itemBuilder: (context, i) =>
                  _userInput.contains(RegExp(r'[A-Z]', caseSensitive: false)) ==
                          getUser[i]
                              .constituents
                              .contains(RegExp(r'[A-Z]', caseSensitive: false))
                      ? ChangeNotifierProvider.value(
                          value: getUser[i],
                          child: SearchItems(),
                        )
                      : Container(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            )),
          ],
        ),
        bottomSheet: Container(
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
                        _count == null || _userInput.isEmpty
                            ? '0 items'
                            : '$_count',
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
        ));
  }
}

//     //provide items matching
//     //th full name of item in the cart
//     //or any letter matching one letter containing the
//     //the 1st to 3rd item index

//     //Thi is done this way because we are not quering real database
//     ((_userInput.toLowerCase() ==
//                     getUser[i].constituents.toLowerCase()) ||
//                 _userInput.toLowerCase() ==
//                     getUser[i].constituents[0].toLowerCase()) ||
//             (_userInput.toLowerCase() ==
//                 getUser[i].constituents[1].toLowerCase()) ||
//             (_userInput.toLowerCase() ==
//                 getUser[i].constituents[2].toLowerCase()) ||
//             (_userInput.toLowerCase() ==
//                 getUser[i].constituents[3].toLowerCase())
