import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/item_type_repo.dart';

class ItemRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('item');

  final ItemTypeRepository _itemType = ItemTypeRepository();

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
}
