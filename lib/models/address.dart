class Address {
  String id, receiver, phone, address;

  String get getReceiver => receiver;
  String get getPhone => phone;
  String get getAddress => address;
  String get getID => id;

  Address({this.receiver, this.phone, this.address});

  void setID(String id) {
    this.id = id;
  }

  Map<String, dynamic> _addressToJson(Address data) {
    var map = Map<String, dynamic>();
    map['receiver'] = data.getReceiver;
    map['phone'] = data.getPhone;
    map['address'] = data.getAddress;
    return map;
  }

  Map<String, dynamic> toJson() => _addressToJson(this);

  Address.fromJson(Map<String, dynamic> map) {
    this.address = map['address'];
    this.phone = map['phone'];
    this.receiver = map['receiver'];
  }
}
