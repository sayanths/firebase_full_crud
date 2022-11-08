class ProductModel {
  final String productName;
  final String category;
  final String company;
  final String description;
  final String price;
  final String qty;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;

  ProductModel({
     this.image1,
     this.image2,
    this.image3,
    this.image4,
    required this.productName,
    required this.category,
    required this.company,
    required this.description,
    required this.price,
    required this.qty,
  });

  factory ProductModel.fromSnapShot(Map<String, dynamic> snapshot) {
    return ProductModel(
      productName: snapshot["productName"],
      category: snapshot["category"],
      company: snapshot["company"],
      description: snapshot["description"],
      price: snapshot["price"],
      qty: snapshot["qty"],
      image1: snapshot["image1"],
      image2: snapshot["image2"],
      image3: snapshot["image3"],
      image4: snapshot["image4"],
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
      "image1":image1,
      "image2":image2,
      "image3":image3,
      "image4":image4,
    };
  }
}


class Response{
  int? code;
  String? message;
  Response({this.code,this.message});
}