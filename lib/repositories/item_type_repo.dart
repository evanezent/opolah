import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/item-type.dart';

class ItemTypeRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('type-item');

  Future getItemType(String itemID) async {
    List<ItemType> listType;

    var res = await collection.where('itemID', isEqualTo: itemID).get();
    if (res.docs.length > 0) {
      res.docs.forEach((element) {
        ItemType type = ItemType.fromJson(element.data());
        listType.add(type);
      });
      print(
          '---------------------------------------------------- ${listType.length}');
      return listType;
    } else {
      return null;
    }
  }
}
