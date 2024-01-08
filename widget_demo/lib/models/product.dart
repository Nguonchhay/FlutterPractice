class Product {
  String? id = '';
  String? imageUrl = '';
  String title = '';
  int quantity = 0;
  double unitPrice = 0.0;
  String? description = '';

  Product({
    required this.title,
    required this.quantity,
    required this.unitPrice,
    this.id,
    this.imageUrl,
    this.description
  });
}
