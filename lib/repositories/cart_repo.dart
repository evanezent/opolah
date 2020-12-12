import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/cart.dart';

class CartRepository {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Stream<QuerySnapshot> getAll() {
    return cartCollection.snapshots();
  }

  Future<List<Cart>> getAllCart() async {
    List<Cart> cartList = [];
    try {
      await cartCollection.get().then((value) {
        value.docs.forEach((element) {
          Cart cart = Cart.fromJson(element.data());
          cart.setID(element.id);
          cartList.add(cart);
        });
      });

      return cartList;
    } catch (e) {
      throw e;
    }
  }
}