import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/item_repo.dart';

class CartRepository {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');
  final ItemRepository _itemRepository = ItemRepository();

  Stream<QuerySnapshot> getAll() {
    return cartCollection.snapshots();
  }

  Future<List<Cart>> getAllCart() async {
    List<Cart> cartList = [];
    try {
      await cartCollection.get().then((value) {
        value.docs.forEach((element) {
          cartList.add(Cart.fromJson(element.data()));
        });
      });

      return cartList;
    } catch (e) {
      throw e;
    }
  }

  // Future getCarts() {
  //   var itemData = _itemRepository.getItem(element['itemID']);
  // }
}
