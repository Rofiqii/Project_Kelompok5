class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({
    required int? totalSize,
    required int? typeId,
    required int? offset,
    required List<ProductModel> products,
  }) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'] is int
        ? json['total_size']
        : int.tryParse(json['total_size'] ?? '');
    _typeId = json['type_id'] is int
        ? json['type_id']
        : int.tryParse(json['type_id'] ?? '');
    _offset = json['offset'] is int
        ? json['offset']
        : int.tryParse(json['offset'] ?? '');
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    } else {
      _products = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = _totalSize;
    data['type_id'] = _typeId;
    data['offset'] = _offset;
    data['products'] = _products.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id'] ?? '');
    name = json['name'];
    description = json['description'];
    price = json['price'] is int
        ? json['price']
        : int.tryParse(json['price'] ?? '');
    stars = json['stars'] is int
        ? json['stars']
        : int.tryParse(json['stars'] ?? '');
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'] is int
        ? json['type_id']
        : int.tryParse(json['type_id'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stars'] = stars;
    data['img'] = img;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type_id'] = typeId;
    return data;
  }
}
