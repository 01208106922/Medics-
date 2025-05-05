class Drug {
  final String name;
  final String description;
  final String image;
  final String stock;
  final String price;


  Drug({
    required this.name,
    required this.description,
    required this.image,
    required this.stock,
    required this.price,
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    final rawImagePath = (json['image'] ?? '').toString().trim();
    final fullImageUrl = Uri.encodeFull("https://cors-anywhere.herokuapp.com/http://www.onlinepharmacy.somee.com$rawImagePath");


    return Drug(
      name: json['name']?.trim() ?? 'Unknown Drug',
      description: json['description']?.trim() ?? 'No description available.',
      image: fullImageUrl,
      stock: json['quantity'] != null ? json['quantity'].toString() : 'Unknown stock',
      price: json['price'] != null ? json['price'].toString() : 'Unknown price',
    );
  }

}
