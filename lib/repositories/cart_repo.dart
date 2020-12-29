import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/cart.dart';

class CartRepository {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Stream<QuerySnapshot> getAll() {
    return cartCollection.snapshots();
  }

  Future<bool> addNewCart(Cart cart) async {
    bool success = true;

    await cartCollection
        .add(cart.toJson())
        .catchError((err) => success = false);
    return success;
  }

  Future<void> deleteTheCart(Cart cart) {
    return cartCollection.doc(cart.getID).delete();
  }

  Stream<List<Cart>> getCarts(String id) {
    return cartCollection
        .where("userID", isEqualTo: id)
        .snapshots()
        .map((value) {
      return value.docs.map((data) => Cart.fromSnapshot(data)).toList();
    });
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
