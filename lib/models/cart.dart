import 'package:opolah/models/item.dart';

class Cart {
  String itemID, type, qty, id;
  Item item;

  Cart(this.itemID, this.type, this.qty, this.item);
  Cart.withId(this.id, this.itemID, this.type, this.qty);

  String get getID => id;
  String get getItemID => itemID;
  String get getType => type;
  String get getQuantity => qty;

  void setID(String id) {
    this.id = id;
  }

  Map<String, dynamic> toJson(Item item, String type, String qty) {
    var map = Map<String, dynamic>();
    map['itemID'] = item.getID;
    map['type'] = type;
    map['qty'] = qty;
    map['item'] = item.toJson();
    return map;
  }

  Cart.fromJson(Map<String, dynamic> map) {
    this.itemID = map['itemID'];
    this.type = map['type'];
    this.qty = map['qty'];
  }
}
