class User {
  String? full_name;
  String? email;
  String? phone;
  String? dob;
  String? photo;
  String? token;

  User({this.full_name, this.email, this.phone, this.token, this.dob, this.photo});

   User.fromJson(Map<String, dynamic> json) {
      full_name = json['full_name'];
      email = json['email'];
      phone = json['phone_number'] ?? '';
      dob   = json['dob'] ?? '';
      photo   = json['thumbnail'] ?? '';
      token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['full_name'] = full_name;
    data['email'] = email;
    data['dob']   = dob;
    data['phone_number'] = phone;
    data['thumbnail']        = photo;
    return data;
  }
}
