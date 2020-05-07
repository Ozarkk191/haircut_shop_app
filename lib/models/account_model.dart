class AddressModel {
  String phone;
  String email;
  String password;

  AddressModel({
    this.phone,
    this.email,
    this.password,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
