class User {
  String _id, _name, _email, _phone, _password, _image;
  // int id, price, star;
  // DateTime date;

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
    if (newID.length > 0) {
      this._id = newID;
    }
  }

  set setName(String newName) {
    if (100 >= newName.length && newName.length > 0) {
      this._name = newName;
    }
  }

  set setPhone(String newPhone) {
    if (newPhone.length > 0) {
      this._phone = newPhone;
    }
  }

  set setEmail(String newEmail) {
    if (newEmail.length > 0) {
      this._email = newEmail;
    }
  }

  set setPassword(String newPassword) {
    if (newPassword.length > 0) {
      this._password = newPassword;
    }
  }

  set setImage(String newImage) {
    if (newImage.length > 0) {
      this._image = newImage;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toJson(User data) {
    var map = Map<String, dynamic>();

    if (data.id != null) {
      map['id'] = data.id;
    }
    if (data.image == null) {
      map['image'] = '';
    }
    map['name'] = data.name;
    map['email'] = data.email;
    map['password'] = data.password;
    map['phone'] = data.phone;

    return map;
  }

  User.fromJson(Map<String, dynamic> map) {
    this._name = map['name'];
    this._email = map['email'];
    this._password = map['password'];
    this._phone = map['phone'];
    this._image = map['image'];
  }
}
