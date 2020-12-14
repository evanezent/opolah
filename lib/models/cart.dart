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
  Item get getItem => item;

  void setID(String id) {
    this.id = id;
  }

  void setQuantity(String qty) {
    this.qty = qty;
  }

  Map<String, dynamic> _cartToJson(Cart cart) {
    var map = Map<String, dynamic>();
    map['itemID'] = cart.item.getID;
    map['type'] = cart.getType;
    map['qty'] = cart.getQuantity;
    map['item'] = cart.getItem.toJson();
    return map;
  }

  Map<String, dynamic> toJson() => _cartToJson(this);

  Cart.fromJson(Map<String, dynamic> map) {
    this.item = Item.fromJson(map['item']);
    this.itemID = map['itemID'];
    this.type = map['type'];
    this.qty = map['qty'];
  }
}
