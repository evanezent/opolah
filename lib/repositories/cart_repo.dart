import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/cart.dart';

class CartRepository {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Stream<QuerySnapshot> getAll() {
    return cartCollection.snapshots();
  }

  Future<List<Cart>> getAllCart(String id) async {
    List<Cart> cartList = [];

    await cartCollection.where("userID", isEqualTo: id).get().then((value) {
      value.docs.forEach((element) {
        Cart cart = Cart.fromJson(element.data());
        cart.setID(element.id);
        cartList.add(cart);
      });
    });

    return cartList;
  }

  addCart(Cart cart) async {
    await cartCollection
        .add(cart.toJson())
        .then((value) => print(value.toString()))
        .catchError((onError) => print(onError.toString()));
  }

  Future<void> addNewCart(Cart cart) {
    return cartCollection.add(cart.toJson());
  }

  Future deleteCart(String id) async {
    bool deleted = false;
    await cartCollection
        .doc(id)
        .delete()
        .then((value) => deleted = true)
        .catchError((onError) => print(onError.toString()));

    return deleted;
  }
}
