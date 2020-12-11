import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/models/item.dart';

class CartRepository {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('item');

  Future<List<Cart>> getAllCart() async {
    List<Cart> cartList = [];

    await cartCollection.get().then((value) {
      value.docs.forEach((element) async {
        await itemCollection
            .where('itemID', isEqualTo: element['itemID'])
            .get()
            .then((value) {
          Item tempItem = Item.fromJson(value.docs[0].data());
          Cart cart = Cart.fromJson(element.data(), tempItem);
          cartList.add(cart);
        });
      });
    });

    print(cartList.length);
    print(cartList[0].getItemID);
    print(cartList[0].getItem.getName);

    return cartList;
  }
}
