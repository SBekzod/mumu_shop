import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Product targetProduct = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            print('Once tapped');
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: targetProduct.id,
            );
          },
          child: Image.network(
            targetProduct.imageUrl,
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
            targetProduct.title,
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
