// import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String _id, _name, _email, _phone, _password, _image;

  User(this._name, this._email, this._password, this._phone);
  User.withId(this._id, this._name, this._email, this._image, this._password,
      this._phone);

  String get id => _id;
  String get name => _name;
  String get image => _image;
  String get email => _email;
  String get phone => _phone;
  String get password => _password;

  void setID(String newID) {
    if (newID.isNotEmpty) {
      _id = newID;
    }
  }

  set setName(String newName) {
    if (100 >= newName.length && newName.isNotEmpty) {
      _name = newName;
    }
  }

  set setPhone(String newPhone) {
    if (newPhone.isNotEmpty) {
      _phone = newPhone;
    }
  }

  set setEmail(String newEmail) {
    if (newEmail.isNotEmpty) {
      _email = newEmail;
    }
  }

  set setPassword(String newPassword) {
    if (newPassword.isNotEmpty) {
      _password = newPassword;
    }
  }

  set setImage(String newImage) {
    if (newImage.isNotEmpty) {
      _image = newImage;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toJson(User data) {
    var map = <String, dynamic>{};
    map['image'] = data.image;
    map['name'] = data.name;
    map['email'] = data.email;
    map['password'] = data.password;
    map['phone'] = data.phone;

    return map;
  }

  User.fromJson(Map<String, dynamic> map) {
    _name = map['name'];
    _email = map['email'];
    _password = map['password'];
    _phone = map['phone'];
    _image = map['image'];
  }

  // User.fromSnapshot(DocumentSnapshot map) {
  //   this._id = map.id;
  //   this._name = map.data()['name'];
  //   this._email = map.data()['email'];
  //   this._password = map.data()['password'];
  //   this._phone = map.data()['phone'];
  //   this._image = map.data()['image'];
  // }
}
