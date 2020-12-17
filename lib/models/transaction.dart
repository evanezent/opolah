import 'package:opolah/models/address.dart';
import 'package:opolah/models/item.dart';

class Transaction {
  String id, total, paymentProof;
  Address address;
  List<Item> items;
}
