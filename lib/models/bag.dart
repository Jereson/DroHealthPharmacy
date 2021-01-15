import 'package:flutter/foundation.dart';

class BagItem {
  final String id;
  final String title;
  final String constituent;
  final int quantity;
  double price;
  final String image;
  BagItem({
    this.id,
    this.title,
    this.constituent,
    this.quantity,
    this.price,
    this.image,
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

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int updateQuantity(int count) {
    int newQuantity = itemCount + count;
    return newQuantity;
  }

  double updatePrice(int count) {
    double newPrice = totalAmount * count;
    return newPrice;
  }

  //Add items to bag
  void addItem(
    String productId,
    String title,
    String constituent,
    double price,
    String image,
  ) {
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
