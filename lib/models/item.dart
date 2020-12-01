class Item {
  String _name, image;
  int id, price, star;
  DateTime date;

  Item(this._name, this.image, this.star, this.date);
  Item.withId(this.id, this._name, this.image, this.star, this.date);

  int get getID => id;
  int get getPrice => price;
  int get getStar => price;
  String get getName => _name;
  String get getImage => image;
  DateTime get getDate => date;

  set setName(String newName) {
    if (100 >= newName.length && newName.length > 0) {
      this._name = newName;
    }
  }

  set setImage(String newImage) {
    if (100 >= newImage.length && newImage.length > 0) {
      this.image = newImage;
    }
  }

  set setStar(int newStar) {
    if (5 >= newStar && newStar >= 0) {
      this.star = newStar;
    }
  }

  set setPrice(int newPrice) {
    if (newPrice >= 0) {
      this.price = newPrice;
    }
  }

  set setDate(DateTime newDate) {
    Duration diff = newDate.difference(DateTime.now());
    if (diff.inHours >= 0) {
      this.date = newDate;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = _name;
    map['image'] = image;
    map['price'] = price;
    map['star'] = star;
    map['date'] = date;
    return map;
  }

  Item.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this._name = map['name'];
    this.price = map['price'];
    this.image = map['image'];
    this.star = map['star'];
    this.date = map['date'];
  }
}
