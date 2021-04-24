import 'package:flutter/material.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        (ModalRoute.of(context).settings.arguments as String);

    final productsDate = Provider.of<Products>(context, listen: false);
    Product targetProduct;

    for(int i=0; i<productsDate.items.length; i++) {
      if(productsDate.items[i].id == productId) {
        targetProduct = productsDate.items[i];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product id: ${targetProduct.title}'),
      ),
    );
  }
}
