import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/item.dart';
import 'dart:async';

class ItemRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('item');

  Future<List<Item>> getStream() async {
    List<Item> itemList = [];

    await collection.get().then((value) {
      value.docs.forEach((element) {
        Item item = Item.fromJson(element.data());
        itemList.add(item);
      });
    });

    return itemList;
  }

  Stream<List<Item>> getItems() {
    return collection.snapshots().map((value) {
      return value.docs.map((data) => Item.fromSnapshot(data)).toList();
    });
  }

  Future<Map> getItem(String id) async {
    var res = await collection.where('itemID', isEqualTo: id).get();
    return res.docs[0].data();
  }
}
