import 'package:flutter/material.dart';
import '../providers/orders.dart' as aimed;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final aimed.OrderItem orderItem;

  OrderItem(this.orderItem);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    void changeStater() {
      print('butt: expend_more button was pressed');
      setState(() {
        _expanded = !_expanded;
      });
    }

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.orderItem.amount.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(widget.orderItem.time),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                changeStater();
              },
            ),
          ),
          if (this._expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height:
                  min(widget.orderItem.cartProducts.length * 20.0 + 20, 180.0),
              child: ListView.builder(
                itemCount: widget.orderItem.cartProducts.length,
                itemBuilder: (ctx, i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${widget.orderItem.cartProducts[i].title}',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${widget.orderItem.cartProducts[i].quantity} x \$${widget.orderItem.cartProducts[i].price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
