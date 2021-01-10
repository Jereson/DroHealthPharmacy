import 'package:flutter/material.dart';

class ManageBag extends StatefulWidget {
  final String title;
  final String constituent;
  final double price;
  final int quantity;

  ManageBag(
    this.title,
    this.price,
    this.quantity,
    this.constituent,
  );

  @override
  _ManageBagState createState() => _ManageBagState();
}

class _ManageBagState extends State<ManageBag> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          !_expand
              ? Container(
                  color: Colors.red,
                  child: ListTile(
                    leading:
                        !_expand ? Text(widget.constituent) : SizedBox.shrink(),
                    title: Text(widget.title),
                    subtitle:
                        Text('Total: ${(widget.price * widget.quantity)}'),
                    trailing: Text('${widget.quantity} '),
                  ),
                )
              : Container(height: 50.0, color: Colors.red)
        ],
      ),
    );
  }
}
