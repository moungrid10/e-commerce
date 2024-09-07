class CartItemModel{
String productId, title, variationId;
String? image, brandName;
double price;
int quantity;
Map<String, String>? selectedVariation;

CartItemModel({
  required this.productId,
  required this.quantity,
  this.image,
  this.price =0.0,
  this.title='',
  this.brandName,
  this.selectedVariation,
  this.variationId='',
});

static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

Map<String, dynamic> toJson() {
  return {
    'productId' : productId,
    'title' : title,
    'price' : price,
    'image' : image,
    'quantity' : quantity,
    'variationId' : variationId,
    'brandName' : brandName,
    'selectedVariation' : selectedVariation,
    
  };
}

factory CartItemModel.fromJson(Map<String, dynamic> json) {
  return CartItemModel(
    productId: json['productId'],
    title: json['title'],
    price: (json['price'] is String)
        ? double.tryParse(json['price']) ?? 0.0
        : (json['price'] as num).toDouble(),
    image: json['image'],
    quantity: json['quantity'],
    variationId: json['variationId'],
    brandName: json['brandName'],
    selectedVariation: json['selectedVariation'] != null 
        ? Map<String, String>.from(json['selectedVariation']) 
        : null,
  );
}


}