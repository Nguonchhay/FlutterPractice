class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  Product({
    this.id = '',
    required this.title,
    this.description = '',
    required this.price,
    required this.imageUrl,
    this.isFavorite = false
  });
}