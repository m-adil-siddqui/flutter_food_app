class Product {
  String? id;
  String? title;
  String? tagline;
  String? slug;
  num? discount, price;
  String? desc;
  List<dynamic>? images;

  Product(
      {this.id,
      this.title,
      this.tagline,
      this.slug,
      this.discount,
      this.price,
      this.desc,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    tagline = json['tagline'];
    slug = json['slug'];
    discount = json['discount'];
    price = json['price'];
    desc = json['desc'];
    images = List<dynamic>.from(json['images'].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['tagline'] = tagline;
    data['slug'] = slug;
    data['discount'] = discount;
    data['price'] = price;
    data['desc'] = desc;
    data['images'] = images;
    return data;
  }
}

List<Product> productFromJson(jsonString){
  if(jsonString['products'].length != 0 && jsonString['products'] != null){
    return List<Product>.from(jsonString['products'].map((x) => Product.fromJson(x)));
  }else{
    return <Product>[];
  }
}

Product singleProductFromJson(jsonString){
  return Product.fromJson(jsonString['product']); 
}
