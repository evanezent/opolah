import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/item_repo.dart';

class CartRepository {
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');
  final ItemRepository _itemRepository = ItemRepository();

  Future<List<Cart>> getAllCart() async {
    List<Cart> cartList = [];

    await cartCollection.get().then((value) {
      print("1");
      value.docs.forEach((element) async {
        print("2");
        await _itemRepository.getItem(element['itemID']).then((value) {
          print("3");
          Item tempItem = Item.fromJson(value);
          Cart cart = Cart.fromJson(element.data(), tempItem);
          print("ASDDAS AD AF  FGHG");
          cartList.add(cart);
          print(cartList[0].getItemID);
        });
      });
    });

    print('asd asd asf f s ${cartList.length}');
    return cartList;
  }
}
