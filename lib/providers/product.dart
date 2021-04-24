import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool favorite;

  Product({@required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.favorite = false});

  void toggleFavoriteStatus() {
    this.favorite == false ? this.favorite = true : this.favorite = false;
    notifyListeners();
  }

  bool get getFavoriteStatus {
    return this.favorite;
  }

}


