import 'package:drohealthpharm/models/product.dart';
import 'package:drohealthpharm/screens/my_bag.dart';
import 'package:drohealthpharm/screens/product_detail.dart';
import 'package:drohealthpharm/screens/slash_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './provider/product_provider.dart';
import 'package:drohealthpharm/screens/product_overview.dart';

import 'models/bag.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: Bag()),
        ChangeNotifierProvider.value(value: Product()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DRO Health’s pharmacy',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'ProximaNova',
          brightness: Brightness.light,
        ),
        home: SpashScreen(),
        routes: {
          ProductDetail.routName: (ctx) => ProductDetail(),
          MyBag.routName: (ctx) => MyBag(),
          ProductOverview.routName: (ctx) => ProductOverview(),
        },
      ),
    );
  }
}
