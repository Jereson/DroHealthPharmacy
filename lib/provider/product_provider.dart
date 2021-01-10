import '../models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  int increaseCount;
  //All dummy product
  static List<Product> _items = [
    Product(
        id: 'JKFUHDKI3E',
        designId: 'Packs',
        title: 'Abtei',
        constituents: 'Come',
        description: 'Galle 80-Dragees',
        image: 'assets/images/abtei.jpg',
        price: 20,
        size: '3X10',
        count: 1),
    Product(
      id: 'GHEYU7SUHG',
      designId: 'Buffer',
      title: 'Buffer',
      constituents: 'Collection of Foods',
      description: 'Rich African Food',
      image: 'assets/images/collection.jpg',
      price: 100,
      size: 'Indoor Service',
      count: 1,
    ),
    Product(
        id: 'KU84HRYDHS',
        designId: 'Packs',
        title: 'Aktiv',
        constituents: 'Lecithin',
        description: 'Lecithin +B-Vitamine',
        image: 'assets/images/lecithin.jpg',
        price: 10,
        size: '3X10',
        count: 1),
    Product(
        id: 'OLE7UJDHYE',
        designId: 'Pack',
        title: 'Sunkea',
        constituents: 'White Clay Coat',
        description: 'Rich in nutrient varities',
        image: 'assets/images/claycoat.jpg',
        price: 40,
        size: '2X2',
        count: 1),
    Product(
        id: 'KIOEL9IKJD',
        designId: 'Pack',
        title: 'Varities',
        constituents: 'Sweet Food',
        description: 'Door Step Service',
        image: 'assets/images/pack.jpg',
        price: 120,
        size: '3X10',
        count: 1),
    Product(
        id: 'KILE9IKDJK',
        designId: 'Pack',
        title: 'Cheeze',
        constituents: 'Cheeze Pops',
        description: 'Snacks like never',
        image: 'assets/images/cheeze.jpg',
        price: 20,
        size: '3X10',
        count: 1),
    Product(
      id: 'LOIR9IOEHD',
      designId: 'Fresh',
      title: 'Berry',
      constituents: 'Fresh Berry',
      description: 'Fruit rich in Vitamin',
      image: 'assets/images/berry.jpg',
      price: 10,
      size: '3X10',
      count: 1,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  //Add all product and listen to changes
  void addProduct() {
    notifyListeners();
  }

  //Search items
  List<Product> searchItem = List.from(_items);
  searchItems() {
    searchItem = _items.where((element) => element.id.contains(element.id));
    notifyListeners();
  }

  Product getProductDetail(String getTitle) {
    return _items.firstWhere((element) => element.title == getTitle);
  }
}
