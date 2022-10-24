class News {
  int? _totalSize;//underscore '_' if private
  int? _typeId;
  int? _offset;
  late List<ProductModel> _news;
  List<ProductModel> get news=>_news;

  News({required totalSize, required typeId,required offset, required news}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._news = news;
  }

  News.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['news'] != null) {
      _news = <ProductModel>[];
      json['news'].forEach((v) {
        _news.add(ProductModel.fromJson(v));//put !bang operator if not sure
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? status;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel({this.id, this.name, this.description,
    this.price,
    this.status,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    typeId = json['type_id'];
  }
}
