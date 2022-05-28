import 'package:opolah/models/item.dart';

class Cart {
  String? itemID, type, qty, id, userID;
  bool? choosed;
  Item? item;

  Cart(this.itemID, this.userID, this.type, this.qty, this.item);
  Cart.withId(
      this.id, this.itemID, this.userID, this.type, this.qty, this.item);

  String get getID => id!;
  String get getItemID => itemID!;
  String get getUserID => userID!;
  String get getType => type!;
  String get getQuantity => qty!;
  Item get getItem => item!;
  bool get getChoosed => choosed!;

  void setID(String id) {
    this.id = id;
  }

  void setQuantity(String qty) {
    this.qty = qty;
  }

  Map<String, dynamic> _cartToJson(Cart cart) {
    var map = <String, dynamic>{};
    map['itemID'] = cart.item!.getID;
    map['userID'] = cart.getUserID;
    map['type'] = cart.getType;
    map['qty'] = cart.getQuantity;
    map['item'] = cart.getItem.toJson();
    return map;
  }

  Map<String, dynamic> toJson() => _cartToJson(this);

  Cart.fromJson(Map<String, dynamic> map) {
    item = Item.fromJson(map['item']);
    itemID = map['itemID'];
    userID = map['userID'];
    type = map['type'];
    qty = map['qty'];
    choosed = false;
  }
}
