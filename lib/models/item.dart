class Item {
  String name, image, id;
  double price, star;
  DateTime date;

  Item(this.name, this.image, this.star, this.price);
  Item.withId(this.id, this.name, this.image, this.star, this.date);

  String get getID => id;
  double get getPrice => price;
  double get getStar => star;
  String get getName => name;
  String get getImage => image;
  DateTime get getDate => date;

  set setName(String newName) {
    if (100 >= newName.length && newName.length > 0) {
      this.name = newName;
    }
  }

  set setImage(String newImage) {
    if (newImage.length > 0) {
      this.image = newImage;
    }
  }

  set setStar(double newStar) {
    if (5 >= newStar && newStar >= 0) {
      this.star = newStar;
    }
  }

  set setPrice(double newPrice) {
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
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['rating'] = star;
    return map;
  }

  Item.fromJson(Map<String, dynamic> map) {
    this.id = map['itemID'];
    this.name = map['name'];
    this.price = double.parse(map['price']);
    this.image = map['image'];
    this.star = double.parse(map['rating']);
  }
}
