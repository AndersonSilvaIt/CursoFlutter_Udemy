import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...items};
    // retorna uma cópia da lista, para não retornar a referência,
    //para não ser alterado em outro ponto
  }

  int get itemsCount {
    return _items.length;
  }

  double get totlaAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => CartItem(
                id: existingItem.id,
                productId: existingItem.productId,
                name: existingItem.name,
                quantity: existingItem.quantity + 1,
                price: existingItem.price,
              ));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                productId: product.id,
                name: product.name,
                quantity: 1,
                price: product.price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}