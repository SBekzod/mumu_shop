import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
          onDoubleTap: () {
            print('Double tapped');
          },
          onTap: () {
            print('You taped the picture');
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
              return null;
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            this.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () => null,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
