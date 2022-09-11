class Category {
  String? id;
  String? title;
  String? image;

  Category({this.id, this.title, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}

List<Category> categoryFromJson(jsonString){
  return List<Category>.from(jsonString['categories'].map((x) => Category.fromJson(x)));
}
