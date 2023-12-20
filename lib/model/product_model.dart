import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "pname")
  final String? name;
  @JsonKey(name: "pprice")
  final String? price;
  @JsonKey(name: "pdesc")
  final String? desc;
  Product({this.name , this.price , this.desc, this.id});


  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}


@JsonSerializable()
class Products {

  @JsonKey(name: "products")
  final List<Product>? products;

  Products({this.products});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}