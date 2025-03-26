class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discountedPrice;
  final double discountPercentage;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    double originalPrice = (json['price'] as num).toDouble();
    double discount = (json['discountPercentage'] as num).toDouble();
    double discountedPrice = originalPrice - (originalPrice * discount / 100);

    return Product(
      id: json['id'],
      name: json['title'],
      image: json['thumbnail'],
      price: originalPrice,
      discountedPrice: discountedPrice,
      discountPercentage: discount,
      category: json['category'] ?? 'Unknown',
    );
  }
}
