import 'package:opolah/models/address.dart';
import 'package:opolah/models/cart.dart';

class TransactionClass {
  String id, total, paymentProof, bank, shippingCost;
  Address address;
  List<Cart> carts;

  TransactionClass(this.total, this.bank, this.paymentProof, this.address,
      this.carts, this.shippingCost);

  String get getID => id;
  String get getBank => bank;
  String get getTotal => total;
  String get getProof => paymentProof;
  String get getCost => shippingCost;
  Address get getAddress => address;
  List<Cart> get getCarts => carts;

  void setID(String id) {
    this.id = id;
  }

  Map<String, dynamic> toJson() => transactionToJson(this);

  Map<String, dynamic> transactionToJson(TransactionClass data) {
    var map = Map<String, dynamic>();

    map['total'] = data.getTotal;
    map['bank'] = data.getBank;
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
    this.address = Address.fromJson(map['address']);
    this.bank = map['bank'];
    this.total = map['total'];
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
