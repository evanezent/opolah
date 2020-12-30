import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  String id, userID, receiver, phone, address;

  String get getReceiver => receiver;
  String get getPhone => phone;
  String get getAddress => address;
  String get getID => id;
  String get getUserID => userID;

  Address({this.userID, this.receiver, this.phone, this.address});

  void setID(String id) {
    this.id = id;
  }

  Map<String, dynamic> _addressToJson(Address data) {
    var map = Map<String, dynamic>();
    map['receiver'] = data.getReceiver;
    map['phone'] = data.getPhone;
    map['address'] = data.getAddress;
    map['userID'] = data.getUserID;
    return map;
  }

  Map<String, dynamic> toJson() => _addressToJson(this);

  Address.fromJson(Map<String, dynamic> map) {
    this.address = map['address'];
    this.phone = map['phone'];
    this.receiver = map['receiver'];
    this.userID = map['userID'];
  }

  Address.fromSnapshot(DocumentSnapshot map) {
    this.id = map.id;
    this.userID = map.data()['userID'];
    this.address = map.data()['address'];
    this.phone = map.data()['phone'];
    this.receiver = map.data()['receiver'];
  }
}
