import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/item.dart';
import 'dart:async';

class ItemRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('item');

  Stream<List<Item>> getItems() {
    return collection.snapshots().map((value) {
      return value.docs.map((data) => Item.fromSnapshot(data)).toList();
    });
  }
}
