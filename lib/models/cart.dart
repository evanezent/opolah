class Cart {
  String itemID, type, qty, id;

  Cart(this.itemID, this.type, this.qty);
  Cart.withId(this.id, this.itemID, this.type, this.qty);

  String get getID => id;
  String get getItemID => itemID;
  String get getType => type;
  String get getQuantity => qty;

  void setID(String id) {
    this.id = id;
  }

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

  Cart.fromJson(Map<String, dynamic> map) {
    this.itemID = map['itemID'];
    this.type = map['type'];
    this.qty = map['qty'];
  }
}
