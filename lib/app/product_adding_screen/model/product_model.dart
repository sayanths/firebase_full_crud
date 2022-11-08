class ProductModel {
  final String productName;
  final String category;
  final String company;
  final String description;
  final String price;
  final String qty;
  final String? image;

  ProductModel({
    required this.productName,
    required this.category,
    required this.company,
    required this.description,
    required this.price,
    required this.qty,
    this.image,
  });

  factory ProductModel.fromSnapShot(Map<String, dynamic> snapshot) {
    return ProductModel(
      productName: snapshot["productName"],
      category: snapshot["category"],
      company: snapshot["company"],
      description: snapshot["description"],
      price: snapshot["price"],
      qty: snapshot["qty"],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      "productName": productName,
      "category": category,
      "company": company,
      "description": description,
      "price": price,
      "qty": qty,
    };
  }
}
