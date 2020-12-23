import 'package:opolah/models/address.dart';
import 'package:opolah/models/cart.dart';

class TransactionClass {
  String id, total, paymentProof, bank, shippingCost, date, userID;
  Address address;
  List<Cart> carts;
  bool done;

  TransactionClass(this.userID, this.total, this.bank, this.paymentProof,
      this.address, this.carts, this.shippingCost, this.date, this.done);

  String get getID => id;
  String get getUserID => userID;
  String get getBank => bank;
  String get getDate => date;
  String get getTotal => total;
  String get getProof => paymentProof;
  String get getCost => shippingCost;
  Address get getAddress => address;
  bool get getStatus => done;
  List<Cart> get getCarts => carts;

  void setID(String id) {
    this.id = id;
  }

  Map<String, dynamic> toJson() => transactionToJson(this);

  Map<String, dynamic> transactionToJson(TransactionClass data) {
    var map = Map<String, dynamic>();

    map['total'] = data.getTotal;
    map['userID'] = data.getUserID;
    map['bank'] = data.getBank;
    map['done'] = data.getStatus;
    map['date'] = data.getDate;
    map['proof'] = data.getProof;
    map['cost'] = data.getCost;
    map['addres'] = data.getAddress.toJson();
    map['carts'] = _cartListing(data.getCarts);

    return map;
  }

  List<Map<String, dynamic>> _cartListing(List<Cart> carts) {
    if (carts == null) {
      return null;
    }
    List<Map<String, dynamic>> cartMap = List<Map<String, dynamic>>();
    carts.forEach((cart) {
      cartMap.add(cart.toJson());
    });

    return cartMap;
  }

  TransactionClass.fromJson(Map<String, dynamic> map) {
    this.address = Address.fromJson(map['addres']);
    this.bank = map['bank'];
    this.userID = map['userID'];
    this.total = map['total'];
    this.done = map['done'];
    this.date = map['date'];
    this.shippingCost = map['cost'];
    this.paymentProof = map['proof'];
    this.carts = _convertCarts(map['carts']);
  }

  List<Cart> _convertCarts(List cartMap) {
    if (cartMap == null) {
      return null;
    }
    List<Cart> carts = List<Cart>();
    cartMap.forEach((value) {
      carts.add(Cart.fromJson(value));
    });

    return carts;
  }
}
