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
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: null,
        ),
        title: Text(
          this.title,
          textAlign: TextAlign.center,
        ),
      ),
      child: Image.network(
        this.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
