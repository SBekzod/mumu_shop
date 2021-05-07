import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        (ModalRoute.of(context).settings.arguments as String);

    final loadedProduct = Provider.of<Products>(context, listen: false)
        .findByProductId(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product id: ${loadedProduct.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              child: (loadedProduct.imageUrl != "none")
                  ? Image.network(
                      loadedProduct.imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Image(image: AssetImage('assets/pictures/book.jpg')),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
