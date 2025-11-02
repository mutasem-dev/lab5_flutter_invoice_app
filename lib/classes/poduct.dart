class Product {
  String poductName;
  int quantity;
  double price;
  Product({
    required this.poductName,
    required this.quantity,
    required this.price,
  });
  @override
  String toString() {
    return '$poductName, price: $price, quantity: $quantity)';
  }
}
