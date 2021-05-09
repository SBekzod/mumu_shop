import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Books',
      description: 'Prepare yourself for life.',
      price: 9.99,
      imageUrl:
          'https://d2r68eeixpqexd.cloudfront.net/41fd2ced63aa8d47a3142fa4cd46849b.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Playstation',
      description: 'Prepare yourself for game.',
      price: 949.99,
      imageUrl:
          'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/Untitled1578.png',
    ),
    Product(
      id: 'p3',
      title: 'Ball',
      description: 'Prepare yourself for sports.',
      price: 5.00,
      imageUrl:
          'https://soccerballworld.com/wp-content/uploads/2020/04/alphabet-word-images-1295331_640.png',
    ),
    Product(
      id: 'p4',
      title: 'Cyber truck',
      description: 'Prepare yourself for life.',
      price: 56000.00,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-tesla-cyber-truck-mmp-1-1579127142.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 6.05,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 30.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 2.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p8',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 1.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Bestseller book',
      description: 'Prepare yourself to Black and White.',
      price: 1000.00,
      imageUrl: 'none',
    ),
    Product(
      id: 'p10',
      title: 'Tickets',
      description: 'Prepare yourself to travel to USA.',
      price: 2500.00,
      imageUrl: 'https://lp-cms-production.imgix.net/2019-06/373321b4ae427b2d482bc246a4e04476-usa.jpg',
    ),
  ];

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
  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  Product findByProductId(String productId) {
    var product;
    _items.forEach((element) {
      if (element.id == productId) {
        product = element;
      }
    });
    return product;
  }
}
