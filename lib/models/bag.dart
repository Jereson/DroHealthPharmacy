import 'package:flutter/foundation.dart';

class BagItem {
  final String id;
  final String title;
  final String constituent;
  final int quantity;
  double price;
  final String image;
  BagItem({
    @required this.id,
    @required this.title,
    @required this.constituent,
    @required this.quantity,
    @required this.price,
    @required this.image,
  });
}

class Bag with ChangeNotifier {
  Map<String, BagItem> _items = {};

  Map<String, BagItem> get items {
    return {..._items};
  }

  //get the number of bag items
  int get itemCount {
    return _items.length;
  }

  //calculate temporary total amount
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  //Add items to bag
  void addItem(String productId, String title, String constituent, double price,
      String image) {
    if (_items.containsKey(productId)) {
      //If added change qauntity
      _items.update(
        productId,
        (initialBagItem) => BagItem(
          id: initialBagItem.id,
          title: initialBagItem.title,
          constituent: initialBagItem.constituent,
          price: initialBagItem.price,
          quantity: initialBagItem.quantity + 1,
          image: initialBagItem.image,
        ),
      );
    } else {
      //Add new item
      _items.putIfAbsent(
        productId,
        () => BagItem(
            id: DateTime.now().toString(),
            title: title,
            constituent: constituent,
            price: price,
            quantity: 1,
            image: image),
      );
    }

    notifyListeners();
  }

//Delete item
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
