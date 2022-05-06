// import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String id;
  String name = "", image = "";
  late double price;
  double star = 0;
  late DateTime date;

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

  Map<String, dynamic> _itemToJson(Item item) {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['itemID'] = item.getID;
    }
    map['name'] = item.getName;
    map['image'] = item.getImage;
    map['price'] = item.getPrice.toString();
    map['rating'] = item.getStar.toString();
    return map;
  }

  Map<String, dynamic> toJson() => _itemToJson(this);

  Item.fromJson(Map<String, dynamic> map) {
    this.id = map['itemID'];
    this.image = map['image'];
    this.name = map['name'];
    this.price = double.parse(map['price']);
    this.star = double.parse(map['rating']);
  }

  // Item.fromSnapshot(DocumentSnapshot map) {
  //   this.id = map.data()['itemID'];
  //   this.name = map.data()['name'];
  //   this.price = double.parse(map.data()['price']);
  //   this.image = map.data()['image'];
  //   this.star = double.parse(map.data()['rating']);
  // }
}
