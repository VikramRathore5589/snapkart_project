class ProductModel {
  String? id; // Maps to _id
  String? name;
  num? price;
  String? image;
  String? description;
  double? discountAmount;
  String? categoryId;
  int? stock;
  int? created; // Timestamp for creation
  int? modified; // Timestamp for last modification
  int? version;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.discountAmount,
    this.categoryId,
    this.stock,
    this.created,
    this.modified,
    this.version,
  });

  // Factory method to create a Product object from JSON
  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      description: json['description'] as String?,
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String?,
      stock: json['stock'] as int?,
      created: json['created'] as int?,
      modified: json['modified'] as int?,
      version: json['__v'] as int?,
    );
  }

  // Method to convert Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'discountAmount': discountAmount,
      'categoryId': categoryId,
      'stock': stock,
      'created': created,
      'modified': modified,
      '__v': version,
    };
  }
}
