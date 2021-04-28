import 'package:flutter/material.dart';
import '../widgets/products_grid_sample.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedValue) {
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (ele) => [
              PopupMenuItem(
                child: Text('Only favorites', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20),),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Show all', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20),),
                value: 1,
              )
            ],
          )
        ],
      ),
      body: ProductsGridSample(),
    );
  }
}
