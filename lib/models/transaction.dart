import 'package:opolah/models/address.dart';
import 'package:opolah/models/item.dart';

class Transaction {
  String id, total, paymentProof, bank, shippingCost;
  Address address;
  List<Item> items;

  Transaction(this.total, this.bank, this.paymentProof, this.address,
      this.items, this.shippingCost);

  String get getID => id;
  String get getBank => bank;
  String get getTotal => total;
  String get getProof => paymentProof;
  String get getCost => shippingCost;
  Address get getAddress => address;
  List<Item> get getItems => items;

  Map<String, dynamic> toJson() => transactionToJson(this);

  Map<String, dynamic> transactionToJson(Transaction data) {
    var map = Map<String, dynamic>();

    map['total'] = data.getTotal;
    map['bank'] = data.getBank;
    map['proof'] = data.getProof;
    map['cost'] = data.getCost;
    map['addres'] = data.getAddress.toJson();
    map['items'] = _itemListing(data.getItems);

    return map;
  }

  List<Map<String, dynamic>> _itemListing(List<Item> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> itemMap = List<Map<String, dynamic>>();
    items.forEach((item) {
      itemMap.add(item.toJson());
    });

    return itemMap;
  }

  Transaction.fromJson(Map<String, dynamic> map) {
    this.address = Address.fromJson(map['address']);
    this.bank = map['bank'];
    this.total = map['total'];
    this.shippingCost = map['cost'];
    this.paymentProof = map['proof'];
    this.items = _convertItems(map['items']);
  }

  List<Item> _convertItems(List itemMap) {
    if (itemMap == null) {
      return null;
    }
    List<Item> items = List<Item>();
    itemMap.forEach((value) {
      items.add(Item.fromJson(value));
    });

    return items;
  }
}
