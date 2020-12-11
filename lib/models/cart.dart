import 'package:opolah/models/item.dart';

class Cart {
  String itemID, type, qty, id;
  Item item;

  Cart(this.itemID, this.type, this.qty, this.item);
  Cart.withId(this.id, this.itemID, this.type, this.qty, this.item);

  String get getID => id;
  String get getItemID => itemID;
  String get getType => type;
  String get getQuantity => qty;
  Item get getItem => item;

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (itemID != null) {
      map['itemID'] = itemID;
    }
    map['type'] = type;
    map['qty'] = qty;
    return map;
  }

  Cart.fromJson(Map<String, dynamic> map, Item item) {
    this.itemID = map['itemID'];
    this.type = map['type'];
    this.qty = map['qty'];
    this.item = item;
  }
}
