import 'dart:ffi';

import 'package:flutter/material.dart';
import './product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [];

  // List<Product> _items = [
  //   Product(
  //     id: 'p1',
  //     title: 'POP',
  //     description: 'Prepare yourself for life.',
  //     price: 9.99,
  //     imageUrl:
  //         'https://d2r68eeixpqexd.cloudfront.net/41fd2ced63aa8d47a3142fa4cd46849b.jpg',
  //   ),
  //   Product(
  //     id: 'p2',
  //     title: 'Playstation',
  //     description: 'Prepare yourself for game.',
  //     price: 949.99,
  //     imageUrl:
  //         'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/Untitled1578.png',
  //   ),
  //   Product(
  //     id: 'p3',
  //     title: 'Ball',
  //     description: 'Prepare yourself for sports.',
  //     price: 5.00,
  //     imageUrl:
  //         'https://soccerballworld.com/wp-content/uploads/2020/04/alphabet-word-images-1295331_640.png',
  //   ),
  //   Product(
  //     id: 'p4',
  //     title: 'Cyber truck',
  //     description: 'Prepare yourself for life.',
  //     price: 56000.00,
  //     imageUrl:
  //         'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-tesla-cyber-truck-mmp-1-1579127142.jpg',
  //   ),
  //   Product(
  //     id: 'p5',
  //     title: 'Shirt',
  //     description: 'A red shirt - it is pretty red!',
  //     price: 6.05,
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  //   ),
  //   Product(
  //     id: 'p6',
  //     title: 'Trousers',
  //     description: 'A nice pair of trousers.',
  //     price: 30.00,
  //     imageUrl:
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
  //   ),
  //   Product(
  //     id: 'p7',
  //     title: 'Yellow Scarf',
  //     description: 'Warm and cozy - exactly what you need for the winter.',
  //     price: 2.99,
  //     imageUrl:
  //         'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
  //   ),
  //   Product(
  //     id: 'p8',
  //     title: 'A Pan',
  //     description: 'Prepare any meal you want.',
  //     price: 1.00,
  //     imageUrl:
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
  //   ),
  //   Product(
  //     id: 'p9',
  //     title: 'Bestseller book',
  //     description: 'Prepare yourself to Black and White.',
  //     price: 1000.00,
  //     imageUrl: 'none',
  //   ),
  //   Product(
  //     id: 'p10',
  //     title: 'Tickets',
  //     description: 'Prepare yourself to travel to USA.',
  //     price: 2500.00,
  //     imageUrl:
  //         'https://lp-cms-production.imgix.net/2019-06/373321b4ae427b2d482bc246a4e04476-usa.jpg',
  //   ),
  // ];

  Future<void> fetchAndSetProducts() async {
    try {
      const url =
          'https://flutter-update-1e5f2-default-rtdb.firebaseio.com/products.json';
      var result = await http.get(url);
      var resultBody = json.decode(result.body) as Map<String, dynamic>;
      print(resultBody);
      resultBody.forEach((key, value) {
        this._items.add(Product(
              id: key,
              title: value['title'],
              description: value['description'],
              price: value['price'],
              imageUrl: value['imageUrl'],
              favorite: value['favorite'] == null ? false : value['favorite'],
            ));
      });
      notifyListeners();
      return;
    } catch (err) {
      throw err;
    }
  }

  List<Product> get items {
    return _items;
  }

  List<Product> get favoriteItems {
    List<Product> favorites = [];
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].getFavoriteStatus == true) {
        favorites.add(_items[i]);
      }
    }
    return favorites;
  }

  Future<void> addProduct(Product product) async {
    // posting request into FB with http packages
    try {
      const url =
          'https://flutter-update-1e5f2-default-rtdb.firebaseio.com/products.json';
      var data = await http.post(
        url,
        body: json.encode({
          "title": product.title,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl
        }),
      );
      print(json.decode(data.body)['name']);
      Product newProduct = Product(
          // id: DateTime.now().toString(),
          id: json.decode(data.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  void editProduct(String id, Product editedProduct) {
    // edit the existed product
    int targetIndex = _items.indexWhere((element) => element.id == id);
    _items[targetIndex] = editedProduct;
    notifyListeners();
    // old version
    // _items.removeWhere((element) => element.id == product.id);
    // _items.add(product);
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Product findByProductId(String productId) {
    return _items.firstWhere((element) => element.id == productId);
  }
}
