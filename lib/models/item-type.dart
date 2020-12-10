class ItemType {
  String itemID, typeName, typeValue;

  ItemType(this.itemID, this.typeName, this.typeValue);

  String get getID => this.itemID;
  String get getName => this.typeName;
  String get getValue => this.typeValue;

  set setName(String newName) {
    if (newName.length > 0) {
      this.typeName = newName;
    }
  }

  set setValue(String newValue) {
    if (newValue.length > 0) {
      this.typeValue = newValue;
    }
  }

  set setItemID(String newID) {
    if (newID.length > 0) {
      this.itemID = newID;
    }
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    if (itemID != null) {
      map['itemID'] = itemID;
    }
    map['name'] = typeName;
    map['value'] = typeValue;
    return map;
  }

  ItemType.fromJson(Map<String, dynamic> map) {
    this.itemID = map['itemID'];
    this.typeName = map['name'];
    this.typeValue = map['value'];
  }
}
