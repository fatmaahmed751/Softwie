class ProductsModel{
  final String image;
  final String description;
  final num  price;
  final num  discountPercentage;
  final num  rating;

  ProductsModel({
  required this.image,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      });

  factory ProductsModel.fromJson(Map<String,dynamic> json ){

    var priceValue = json["price"];
    num price = priceValue is int ? priceValue.toDouble() : priceValue;
    var discount = json["discountPercentage"];
    num discountPercentage = discount is int ? discount.toDouble() : discount;
    var ratePercent = json["rating"];
    num rate = ratePercent is int ? ratePercent.toDouble() : ratePercent;

     return ProductsModel(
      image: json["thumbnail"],
      description: json["description"],
      price: price,
      discountPercentage:discountPercentage,
      rating:rate,

    );
  }
}