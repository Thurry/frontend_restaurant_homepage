// cart_model.dart
import 'package:flutter/foundation.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get totalPrice => _items.fold(
      0.0, (total, current) => total + current.price * current.quantity);

  int get totalItems =>
      _items.fold(0, (total, current) => total + current.quantity);

  void addItem(CartItem item) {
    var existingItem = _items.firstWhere((i) => i.name == item.name,
        orElse: () => CartItem(name: '', price: 0, quantity: 0));
    if (existingItem.name.isNotEmpty) {
      updateItemQuantity(existingItem, existingItem.quantity + item.quantity);
    } else {
      _items.add(item);
      notifyListeners();
    }
  }

  void updateItemQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
