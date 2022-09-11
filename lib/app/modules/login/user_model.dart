class User {
  String? full_name;
  String? email;
  String? phone;
  String? token;

  User({this.full_name, this.email, this.phone, this.token});

   User.fromJson(Map<String, dynamic> json) {
      full_name = json['full_name'];
      email = json['email'];
      phone = json['phone'] ?? '';
      token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['full_name'] = full_name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
