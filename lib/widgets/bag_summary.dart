import 'package:drohealthpharm/models/bag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagSummary extends StatefulWidget {
  final String id;
  final String title;
  final String constituent;
  final double price;
  final int quantity;
  final String image;

  BagSummary(
    this.id,
    this.title,
    this.constituent,
    this.price,
    this.quantity,
    this.image,
  );

  @override
  _BagSummaryState createState() => _BagSummaryState();
}

class _BagSummaryState extends State<BagSummary> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 75.0,
              child: Row(
                children: <Widget>[
                  !_expanded ? clipRrectImage(widget) : SizedBox.shrink(),
                  Spacer(),
                  Text(
                    '${widget.quantity}X',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            title: Text(
              '${widget.constituent}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text('${widget.title}',
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
            trailing: Text(
              '\$${(widget.price * widget.quantity)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        _expanded ? expandedWidget(context, widget) : SizedBox.shrink()
      ],
    );
  }
}

//Image in ClipRRect
Widget clipRrectImage(widget) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Image.asset(
        widget.image,
        fit: BoxFit.fill,
      ),
    ),
  );
}

//Expanded Widget
Widget expandedWidget(BuildContext context, widget) {
  return Container(
    padding: EdgeInsets.only(right: 10, left: 15.0),
    height: 50.0,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Colors.white,
          ),
          onPressed: () {
            Provider.of<Bag>(context, listen: false).removeItem(widget.id);
          },
        ),
        Spacer(),
        Container(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(
                Icons.remove_circle,
                color: Colors.white,
                // size: 38,
              ),
              Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const Icon(
                Icons.add_circle,
                color: Colors.white,
                // size: 30,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
