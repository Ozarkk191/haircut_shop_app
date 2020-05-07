class AddressModel {
  String shopname;
  String firstname;
  String lastname;
  String address;
  double addressLat;
  double addressLon;

  AddressModel({
    this.shopname,
    this.firstname,
    this.lastname,
    this.address,
    this.addressLat,
    this.addressLon,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    shopname = json['shopname'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    address = json['address'];
    addressLat = json['addressLat'];
    addressLon = json['addressLon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopname'] = this.shopname;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['address'] = this.address;
    data['addressLat'] = this.addressLat;
    data['addressLon'] = this.addressLon;
    return data;
  }
}
