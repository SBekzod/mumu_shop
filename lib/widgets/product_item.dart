import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(
      {@required this.id, @required this.title, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            print('Once tapped');
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: this.id,
            );
          },
          child: Image.network(
            this.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print('favorite pressed');
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            this.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () => print('shopping-cart pressed'),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
