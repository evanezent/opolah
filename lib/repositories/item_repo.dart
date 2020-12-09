import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/item.dart';

class ItemRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('item');

  Future<List<Item>> getStream() async {
    List<Item> itemList = [];

    await collection.get().then((value) {
      value.docs.forEach((element) {
        print(element['price']);
        Item item = Item.fromJson(element.data());
        itemList.add(item);
      });
    });

    print(itemList[0]);

    return itemList;
  }
}
